//
//  UserQueryView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/11.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct UserGetView: View {
    @State private var userId = "93926364320105"
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("获取指定用户").foregroundColor(Color.red)
            HStack {
                TextField("用户id", text: $userId).textFieldStyle(RoundedBorderTextFieldStyle())
                MinButton(title: "获取", width: 100) {
                    UserCase.getUser(id: self.userId)
                }
            }
            
            Text("过滤").foregroundColor(Color.red)
            HStack {
                MinButton(title: "select username", width: width) {
                    UserCase.getUserSelect(id: self.userId, isSelect: true)
                }
                
                MinButton(title: "select -username", width: width) {
                    UserCase.getUserSelect(id: self.userId, isSelect: false)
                }
            }
            
            MinButton(title: "expand pointer_test_order") {
                UserCase.getUserExpand(id: self.userId)
            }
        }
    }
}

struct UserGetView_Previews: PreviewProvider {
    static var previews: some View {
        UserGetView()
    }
}
