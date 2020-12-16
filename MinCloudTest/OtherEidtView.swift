//
//  OtherEidtView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/9.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct OtherEidtView: View {
    @Binding var valid: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("其他字段")
                .padding(.top, 24)
            
            MinButton(title: "更新 point(去掉小数）", background: Color.clear) {
                EditCase.updatePoint()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
            
            MinButton(title: "更新 point(去掉小数）", background: Color.clear) {
                EditCase.updatePoint()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
            
            MinButton(title: "更新 polygon(加 1）", background: Color.clear) {
                EditCase.updatePolygon()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
            
            MinButton(title: "更新 file", background: Color.clear) {
                EditCase.updateFile()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
            
            MinButton(title: "更新 object 为 {\"new_key1: 1\",\"new_key2: 2\"}", background: Color.clear) {
                EditCase.updateObj()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)

            MinButton(title: "更新 date 为当前日期", background: Color.clear) {
                EditCase.updateDate()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
            
            MinButton(title: "将 unset 置为空", background: Color.clear) {
                EditCase.unset()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
            
            MinButton(title: "将 object_unset 置为空", background: Color.clear) {
                EditCase.object_unset()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
        }
    }
}
