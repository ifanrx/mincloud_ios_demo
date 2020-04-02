//
//  UserQueryView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/5.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct UserQueryView: View {
    @State private var limit = "10"
    @State private var offset = "0"
    let width = (UIScreen.main.bounds.width - 20)/2 - 10
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ScrollView {
                UserGetView()
                
                HStack {
                    Text("limit")
                    TextField("limit", text: $limit).textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding(.top, 20)
                
                HStack {
                    Text("offset")
                    TextField("offset", text: $offset).textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                MinButton(title: "获取所有用户") {
                    UserCase.findUserList(limit: self.limit, offset: self.offset)
                }
                
                MinButton(title: "获取所有用户(totalCount)") {
                    UserCase.totalCount()
                }.padding(.top, 5)
                
                Text("过滤字段 select").foregroundColor(Color.red).padding(.top, 20)
                HStack {
                    MinButton(title: "select username", width: width) {
                        UserCase.selectNickname(isSelect: true)
                    }
                    
                    MinButton(title: "select -username", width: width) {
                        UserCase.selectNickname(isSelect: false)
                    }
                }
                
                Text("排序").foregroundColor(Color.red).padding(.top, 20)
                HStack {
                    MinButton(title: "created_at", width: width) {
                        UserCase.orderByCreateAt(isAes: true)
                    }
                    
                    MinButton(title: "-created_at", width: width) {
                        UserCase.orderByCreateAt(isAes: false)
                    }
                }
                
                MinButton(title: "expand pointer_test_order ") {
                    UserCase.expandPointer()
                }.padding(.top, 10)
                
            }
        }.padding(EdgeInsets(top: -44, leading: 10, bottom: 0, trailing: 10))
    }
}

struct UserQueryView_Previews: PreviewProvider {
    static var previews: some View {
        UserQueryView()
    }
}
