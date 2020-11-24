//
//  GetQueryView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/9.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI
import MinCloud

struct GetQueryView: View {
    @State private var recordId: String = "5db018f65acfb55e77d0faca"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Get 操作").foregroundColor(Color.red)
            TextField("输入记录 Id", text: $recordId).textFieldStyle(RoundedBorderTextFieldStyle())
            MinButton(title: "获取一条记录") {
                QueryCase.getRecord(self.recordId)
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            
            MinButton(title: "select string") {
                QueryCase.getRecordSelect(id: self.recordId)
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            
            MinButton(title: "select -string") {
                QueryCase.getRecordNSelect(id: self.recordId)
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            
            MinButton(title: "expand created_by") {
                QueryCase.getRecordExpand(id: self.recordId)
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
    }
}

struct GetQueryView_Previews: PreviewProvider {
    static var previews: some View {
        GetQueryView()
    }
}
