//
//  LoginView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/6.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI
import MinCloud

struct LoginView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var pwd: String = ""
    @EnvironmentObject private var store: GlobalStore
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("登录")
                .font(.system(size: 32))
                .foregroundColor(Color.red)
                .frame(width: UIScreen.main.bounds.width - 20, height: 44)
            
            // 邮箱登录
            TextField("邮箱", text: $email).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("密码", text: $pwd).textFieldStyle(RoundedBorderTextFieldStyle())
            MinButton(title: "邮箱登录") {
                UserCase.login(email: self.email, pwd: self.pwd)
            }
            
            // 用户名登录
            TextField("用户名", text: $name).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("密码", text: $pwd).textFieldStyle(RoundedBorderTextFieldStyle())
            MinButton(title: "用户名登录") {
                UserCase.login(name: self.name, pwd: self.pwd)
            }

            MinButton(title: "匿名登录") {
                UserCase.anonymousLogin()
            }

            MinButton(title: "登出") {
                UserCase.logout()
            }
            
            Spacer()
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
