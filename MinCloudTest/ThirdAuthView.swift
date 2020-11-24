//
//  ThirdAuthView.swift
//  MinCloudTest
//
//  Created by quanhua on 2020/1/16.
//  Copyright © 2020 ifanr. All rights reserved.
//

import SwiftUI

struct ThirdAuthView: View {
    
    @State private var phone = ""
    @State private var code = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("第三方登录与绑定")
                .font(.system(size: 32))
                .foregroundColor(Color.red)
                .frame(width: UIScreen.main.bounds.width - 20, height: 44)
            
            VStack(alignment: .leading, spacing: 0.5) {
                TextField("手机号码", text: $phone).textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("验证码", text: $code).textFieldStyle(RoundedBorderTextFieldStyle())
                
                MinButton(title: "发送验证码") {
                    BaaSCase.sendSmsCode(phone: self.phone)
                }
                
                MinButton(title: "手机号+验证码登录+创建用户") {
                    UserCase.signInWithSMS(phone: self.phone, code: self.code, createUser: true)
                }
                
                MinButton(title: "手机号+验证码登录+不创建用户") {
                    UserCase.signInWithSMS(phone: self.phone, code: self.code, createUser: false)
                }
            }
                    
            VStack(alignment: .leading, spacing: 5) {
                MinButton(title: "微信登录+创建用户+overwrite") {
                    UserCase.signIn(with: .wechat, createUser: true, syncUserProfile: .overwrite)
                }
                
                MinButton(title: "微信登录+创建用户+sentx") {
                    UserCase.signIn(with: .wechat, createUser: true, syncUserProfile: .setnx)
                }
                
                MinButton(title: "微信登录+创建用户+flase") {
                    UserCase.signIn(with: .wechat, createUser: true, syncUserProfile: .false)
                }
                
                MinButton(title: "微信登录+不创建用户") {
                    UserCase.signIn(with: .wechat, createUser: false, syncUserProfile: .setnx)
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                MinButton(title: "微信绑定+创建用户+overwrite") {
                    UserCase.associate(with: .wechat, syncUserProfile: .overwrite)
                }
                
                MinButton(title: "微信绑定+创建用户+sentx") {
                    UserCase.associate(with: .wechat, syncUserProfile: .setnx)
                }
                
                MinButton(title: "微信绑定+创建用户+flase") {
                    UserCase.associate(with: .wechat, syncUserProfile: .false)
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                MinButton(title: "微博登录+创建用户+setnx") {
                    UserCase.signIn(with: .weibo, createUser: true, syncUserProfile: .setnx)
                }
                
                MinButton(title: "微博绑定+创建用户+sentx") {
                    UserCase.associate(with: .weibo, syncUserProfile: .setnx)
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                MinButton(title: "苹果登录+创建用户+setnx") {
                    UserCase.signIn(with: .apple, createUser: true, syncUserProfile: .setnx)
                }
                
                MinButton(title: "苹果绑定+创建用户+sentx") {
                    UserCase.associate(with: .apple, syncUserProfile: .setnx)
                }
            }
        }
    }
}
