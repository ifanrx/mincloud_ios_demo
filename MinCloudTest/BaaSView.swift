//
//  BaaSView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/11.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct BaaSView: View {
    @State private var phone = ""
    @State private var code = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ScrollView {
                MinButton(title: "调用云函数") {
                    BaaSCase.invoke()
                }
                
                HStack {
                    Text("手机号码")
                    TextField("手机号码", text: $phone).textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack {
                    Text("验证码")
                    TextField("验证码", text: $code).textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                MinButton(title: "发送手机号码") {
                    BaaSCase.sendSmsCode(phone: self.phone)
                }
                
                MinButton(title: "验证") {
                    BaaSCase.verifySmsCode(phone: self.phone, code: self.code)
                }.padding(.top, 5)
                
                MinButton(title: "获取服务器时间") {
                    BaaSCase.getServerTime()
                }
                
            }
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .navigationBarTitle("BaaS")
    }
}

struct BaaSView_Previews: PreviewProvider {
    static var previews: some View {
        BaaSView()
    }
}
