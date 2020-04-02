//
//  UserInfoView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/6.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI
import MinCloud

struct UserInfoView: View {
    @EnvironmentObject private var store: GlobalStore
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var oldPwd: String = ""
    @State private var newPwd: String = ""
    @State private var city: String = ""
    @State private var emailForResetPwd = ""
    @State private var emailForVerify = ""
    @State private var phone = ""
    @State private var code = ""
    @State private var updatePhone = ""
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("用户操作")
                .font(.system(size: 32))
                .foregroundColor(Color.red)
                .frame(width: UIScreen.main.bounds.width - 20, height: 44)
            
            MinButton(title: "当前用户信息") {
                UserCase.getCurrentUser()
            }
            
            HStack {
                TextField("用户名", text: $username).textFieldStyle(RoundedBorderTextFieldStyle())
                MinButton(title: "更新用户名", width: 100) {
                    UserCase.updateUsername(self.username)
                }
            }
            
            HStack {
                TextField("邮箱", text: $email).textFieldStyle(RoundedBorderTextFieldStyle())
                MinButton(title: "更新邮箱", width: 100) {
                    UserCase.updateEmail(self.email)
                }
            }
            
            VStack {
                TextField("旧密码", text: $oldPwd).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("新密码", text: $newPwd).textFieldStyle(RoundedBorderTextFieldStyle())
                MinButton(title: "更新密码") {
                    UserCase.updatePassword(self.oldPwd, newPwd: self.newPwd)
                }
            }
                        
            HStack {
                TextField("城市(更新自定义字段)", text: $city).textFieldStyle(RoundedBorderTextFieldStyle())
                MinButton(title: "更新城市", width: 100) {
                    UserCase.updateUserInfo(city: self.city)
                }

            }
            
            HStack {
                TextField("填入邮箱以找回密码", text: $emailForResetPwd).textFieldStyle(RoundedBorderTextFieldStyle())
                MinButton(title: "发送邮件", width: 100) {
                    UserCase.resetPassword(email: self.emailForResetPwd)
                }
                
            }
            
            MinButton(title: "邮箱验证") {
                UserCase.emailVerify()
            }
            
            VStack {
                HStack {
                    TextField("输入需更新的手机号", text: $updatePhone).textFieldStyle(RoundedBorderTextFieldStyle())
                    MinButton(title: "更新手机号", width: 100) {
                        UserCase.updatePhone(self.updatePhone)
                    }
                }
                
                Text("-------验证手机号----------")
                
                TextField("输入手机号", text: $phone).textFieldStyle(RoundedBorderTextFieldStyle())
                MinButton(title: "发送验证码") {
                    BaaSCase.sendSmsCode(phone: self.phone)
                }
                TextField("输入验证码", text: $code).textFieldStyle(RoundedBorderTextFieldStyle())
                MinButton(title: "设置手机号") {
                    UserCase.verifyPhone(self.phone, code: self.code)
                }
                
                Text("--------------------------")
            }
            
            
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .alert(isPresented: $store.showMessage) { () -> Alert in
                return showMessageAlert()
        }
        
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
