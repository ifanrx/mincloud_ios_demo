//
//  FileQueryView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/11.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct FileQueryContentView: View {
    @State private var limit = "10"
    @State private var offset = "0"
    let width = (UIScreen.main.bounds.width - 20)/2 - 10
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("文件查询操作").foregroundColor(Color.red).padding(.top, 20)
            
            HStack {
                Text("limit")
                TextField("limit", text: $limit).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            HStack {
                Text("offset")
                TextField("offset", text: $offset).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            MinButton(title: "获取所有文件") {
                FileCase.getFileList(limit: self.limit, offset: self.offset)
            }
            
            MinButton(title: "获取所有文件(totalCount)") {
                FileCase.fileTotalCount()
            }
            
            FileQueryView()
            
            FileSortView()
            
            
            
        }
    }
}

struct FileQueryContentView_Previews: PreviewProvider {
    static var previews: some View {
        FileQueryContentView()
    }
}
