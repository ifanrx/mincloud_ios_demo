//
//  ContentQueryView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/11.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct ContentQueryView: View {
    @State private var limit = "10"
    @State private var offset = "0"
    let width = (UIScreen.main.bounds.width - 20)/2 - 10
    
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
            
            MinButton(title: "获取所有内容") {
                ContentCase.getContentList(limit: self.limit, offset: self.offset)
            }
            
            MinButton(title: "获取所有内容(totalCount)") {
                ContentCase.getContentListTotalCount()
            }
            
            HStack {
                
                MinButton(title: "created_at 升序", width: width) {
                    ContentCase.createAtAes(limit: self.limit, offset: self.offset)
                }
                
                MinButton(title: "created_at 降序", width: width) {
                    ContentCase.createAtDes(limit: self.limit, offset: self.offset)
                }
            }
            
        }
    }
}

struct ContentQueryView_Previews: PreviewProvider {
    static var previews: some View {
        ContentQueryView()
    }
}
