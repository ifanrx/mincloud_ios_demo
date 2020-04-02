//
//  StringQueryView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/10.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct StringQueryView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("字符串 查询").foregroundColor(Color.red).padding(.top, 20)
            MinButton(title: "string contains 'edf'") {
                StringQueryCase.contains()
            }
            MinButton(title: "string icontains 'edf'（不区分大小写）") {
                StringQueryCase.icontains()
            }
            MinButton(title: "正则匹配：string 以 'ed' 开头") {
                StringQueryCase.regexString()
            }
        }
    }
}

struct StringQueryView_Previews: PreviewProvider {
    static var previews: some View {
        StringQueryView()
    }
}
