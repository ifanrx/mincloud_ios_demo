//
//  CurrentUser.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/5.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI
import MinCloud

struct CurrentUserView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 44) {
            ScrollView {
                RegisterView().background(Color.gray.opacity(0.1))
                LoginView().background(Color.gray.opacity(0.1))
                ThirdAuthView().background(Color.gray.opacity(0.1))
                UserInfoView().background(Color.gray.opacity(0.1))
                Text("").frame(width: UIScreen.main.bounds.width - 20, height: 500)
            }
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .navigationBarTitle("当前用户")
    }
}

struct CurrentUser_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserView()
    }
}
