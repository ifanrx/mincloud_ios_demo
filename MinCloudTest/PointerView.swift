//
//  PointerView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/10.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct PointerView: View {
    @Binding var valid: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("pointer = 93926364320105").padding(.top, 24)
            
            Text("pointer 指向 _userprofile 表")
            
            MinButton(title: "更新 pointer 为 93881897279816", background: Color.clear) {
                EditCase.updatePointer(id: "93881897279816")
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
            
           MinButton(title: "查询 pointer: 93926364320105", background: Color.clear) {
                PointerCase.queryPointer(id: "93926364320105")
            }.background(valid ? Color.green : Color.gray)
            .disabled(!valid)
        }
    }
}
