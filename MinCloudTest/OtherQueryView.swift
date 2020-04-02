//
//  OtherQueryView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/10.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct OtherQueryView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("null 查询").foregroundColor(Color.red).padding(.top, 20)
            MinButton(title: "unset属性 null") {
                OtherQueryCase.isNull()
            }
            MinButton(title: "unset属性 not null") {
                OtherQueryCase.isNotNull()
            }
            
            Text("exists 查询").foregroundColor(Color.red).padding(.top, 20)
            MinButton(title: "unset属性 exists") {
                OtherQueryCase.exists()
            }
            MinButton(title: "unset属性 notExists") {
                OtherQueryCase.notExists()
            }
            
            Text("object hasKey查询").foregroundColor(Color.red).padding(.top, 20)
            MinButton(title: "object haskey") {
                OtherQueryCase.hasKey()
            }
            
            Text("组合查询").foregroundColor(Color.red).padding(.top, 20)
            MinButton(title: " 3 <= integer <= 7") {
                OtherQueryCase.combination()
            }
        }
    }
}

struct OtherQueryView_Previews: PreviewProvider {
    static var previews: some View {
        OtherQueryView()
    }
}
