//
//  FileQueryView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/11.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct FileQueryView: View {
    
    @State private var limit = "10"
    @State private var offset = "0"
    @State private var size = "5000"
    
    let width = (UIScreen.main.bounds.width - 20)/2 - 10
    let width3 = (UIScreen.main.bounds.width - 20)/3 - 20
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            HStack {
                Text("文件大小 size: ")
                TextField("大小", text: $size).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack {

                MinButton(title: " size > ", width: width3) {
                    let size = Float(self.size)!
                    FileCase.sizeQuery(op: .greaterThan, size: size)
                }

                MinButton(title: "size = ", width: width3) {
                    let size = Float(self.size)!
                    FileCase.sizeQuery(op: .equalTo, size: size)
                }

                MinButton(title: "size < ", width: width3) {
                    let size = Float(self.size)!
                    FileCase.sizeQuery(op: .lessThan, size: size)
                }
            }
            
            HStack {
                
                MinButton(title: "name = ifanr", width: width) {
                    FileCase.nameQuery(op: .equalTo)
                }
                
                MinButton(title: "name != ifanr", width: width) {
                    FileCase.nameQuery(op: .notEqualTo)
                }
            }
            
            MinButton(title: "category_id = 5d89b531619f0641755294b1") {
                FileCase.categoryIdE(id: "5d89b531619f0641755294b1")
            }

            MinButton(title: "category_name = 美图 ") {
                FileCase.categoryName(op: .equalTo, name: "美图")
            }
        }
    }
}

struct FileQueryView_Previews: PreviewProvider {
    static var previews: some View {
        FileQueryView()
    }
}
