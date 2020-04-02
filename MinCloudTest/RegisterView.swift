//
//  RegisterView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/5.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI
import MinCloud

struct RegisterView: View {
    @EnvironmentObject private var store: GlobalStore
    
    @State var name: String = ""
    @State var email: String = ""
    @State var pwd: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("注册")
                .font(.system(size: 32))
                .foregroundColor(Color.red)
                .frame(width: UIScreen.main.bounds.width - 20, height: 44)
            
            // 邮箱注册
            TextField("邮箱", text: $email).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("密码", text: $pwd).textFieldStyle(RoundedBorderTextFieldStyle())
            MinButton(title: "邮箱注册") {
                UserCase.register(email: self.email, pwd: self.pwd)
            }
            
            // 用户名注册
            TextField("用户名", text: $name).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("密码", text: $pwd).textFieldStyle(RoundedBorderTextFieldStyle())
            MinButton(title: "用户名注册") {
                UserCase.register(name: self.name, pwd: self.pwd)
            }
            
            Spacer()
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
