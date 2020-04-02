//
//  QueryOrderView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/11.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct QueryOrderContentView: View {
    @State private var limit = "10"
    @State private var offset = "0"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("查询操作").foregroundColor(Color.red).padding(.top, 20)
            
            HStack {
                Text("limit")
                TextField("limit", text: $limit).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            HStack {
                Text("offset")
                TextField("offset", text: $offset).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            MinButton(title: "获取全部订单") {
                PaymentCase.orderList(limit: self.limit, offset: self.offset)
            }
            
            QueryOrderView()
            
            Text("").frame(width: UIScreen.main.bounds.width - 20, height: 300)
            
        }
    }
}

struct QueryOrderContentView_Previews: PreviewProvider {
    static var previews: some View {
        QueryOrderContentView()
    }
}
