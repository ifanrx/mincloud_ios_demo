//
//  FileOperationView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/11.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct FileOperationView: View {
    @State fileprivate var valid = false
    @State fileprivate var files = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            MinButton(title: "上传文件+路径") {
                FileCase.uploadFile {
                    self.valid = true
                }
            }
            
            MinButton(title: "上传文件+data方式") {
                FileCase.uploadFile_Data {
                    self.valid = true
                }
            }
            
            MinButton(title: "获取文件详情", background: Color.clear) {
                FileCase.getFile()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
            
            MinButton(title: "删除文件", background: Color.clear) {
                FileCase.deleteFile {
                    self.valid = true
                }
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
            
            Text("删除多个文件").foregroundColor(Color.red).padding(.top, 20)
            TextField("文件id, 以空格隔开", text: $files).textFieldStyle(RoundedBorderTextFieldStyle())
            MinButton(title: "删除") {
                let fileList = self.files.components(separatedBy: " ")
                FileCase.deleteFiles(files: fileList)
            }
        }
    }
}

struct FileOperationView_Previews: PreviewProvider {
    static var previews: some View {
        FileOperationView()
    }
}
