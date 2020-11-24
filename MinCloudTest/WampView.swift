//
//  WampView.swift
//  MinCloudTest
//
//  Created by quanhua on 2020/11/12.
//  Copyright © 2020 ifanr. All rights reserved.
//

import SwiftUI
import MinCloud

struct WampView: View {
    var body: some View {
        
        Text("订阅 danmu 表")
        
        VStack(alignment: .leading, spacing: 5) {
            MinButton(title: "订阅弹幕(create)") {
                WampCase.shared.subscribeCreate()
            }
            
            MinButton(title: "取消订阅create") {
                WampCase.shared.unSubscribeCreate()
            }
            
            MinButton(title: "订阅弹幕(delete)") {
                WampCase.shared.subscribeDelete()
            }
            
            MinButton(title: "取消订阅delete") {
                WampCase.shared.unSubscribeDelete()
            }
            
            MinButton(title: "订阅弹幕(update: desc = 更新") {
                WampCase.shared.subscribeUpdate()
            }
            
            MinButton(title: "取消订阅update") {
                WampCase.shared.unSubscribeDelete()
            }
            
            MinButton(title: "订阅'弹幕'表（不存在）") {
                WampCase.shared.subscribeSchemeNotExists()
            }
            
            MinButton(title: "订阅'notExists'字段（不存在）") {
                WampCase.shared.subscribeInvalidEvent()
            }
            
            MinButton(title: "退出登录") {
                Auth.logout { (result, error) in
                    
                }
            }
        }
    }
}

struct WampView_Previews: PreviewProvider {
    static var previews: some View {
        WampView()
    }
}
