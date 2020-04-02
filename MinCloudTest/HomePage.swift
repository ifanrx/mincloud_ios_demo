//
//  ContentView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/5.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct HomePage: View {
    
    @State var showsAlert = false
    
    struct Item: Identifiable {
        let id: Int
        let item: String
    }
    
    let items: [Item] = [
        Item(id: 1, item: "当前用户"),
        Item(id: 2, item: "用户查询"),
        Item(id: 3, item: "schema 增删改"),
        Item(id: 4, item: "schema 查询"),
        Item(id: 5, item: "schema geo"),
        Item(id: 6, item: "schema 批量"),
        Item(id: 7, item: "内容库"),
        Item(id: 8, item: "文件"),
        Item(id: 9, item: "支付"),
        Item(id: 10, item: "云函数"),
        ]
    
    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    NavigationLink(destination: CurrentUserView()) {
                        Text("当前用户")
                    }
                    NavigationLink(destination: UserQueryView()) {
                        Text("用户查询")
                    }
                    NavigationLink(destination: SchemaEidtView()) {
                        Text("schema 增删改")
                    }
                    NavigationLink(destination: QueryView()) {
                        Text("schema 查询")
                    }
                    NavigationLink(destination: GeoView()) {
                        Text("schema geo")
                    }
                    NavigationLink(destination: BatchView()) {
                        Text("schema 批量")
                    }
                    NavigationLink(destination: ContentView()) {
                        Text("内容库")
                    }
                    NavigationLink(destination: FileView()) {
                        Text("文件")
                    }
                    NavigationLink(destination: PaymentView()) {
                        Text("支付")
                    }
                    NavigationLink(destination: BaaSView()) {
                        Text("云函数/验证码")
                    }
                }.navigationBarTitle("SDK 测试应用")
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
