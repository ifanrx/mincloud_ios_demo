//
//  ContentGetView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/11.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct ContentGetView: View {
    @State private var contentId: String = "1569304572598990"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text("详情查询").foregroundColor(Color.red)
            TextField("内容id", text: $contentId).textFieldStyle(RoundedBorderTextFieldStyle())
            MinButton(title: "获取内容详情") {
                ContentCase.getContent(id: self.contentId)
            }
        }
    }
}

struct ContentGetView_Previews: PreviewProvider {
    static var previews: some View {
        ContentGetView()
    }
}
