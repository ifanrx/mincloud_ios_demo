//
//  FileSortView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/11.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct FileSortView: View {
    @State private var limit = "10"
    @State private var offset = "0"
    let width = (UIScreen.main.bounds.width - 20)/2 - 10
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text("排序").foregroundColor(Color.red).padding(.top, 20)
            
            HStack {
                
                MinButton(title: "created_at 升序", width: width) {
                    FileCase.createdAtSort(limit: self.limit, offset: self.offset, isAes: true)
                }
                
                MinButton(title: "created_at 降序", width: width) {
                    FileCase.createdAtSort(limit: self.limit, offset: self.offset, isAes: false)
                }
            }
            
            HStack {
                MinButton(title: "name 升序", width: width) {
                    FileCase.nameSort(limit: self.limit, offset: self.offset, isAes: true)
                }
                
                MinButton(title: "name 降序", width: width) {
                    FileCase.nameSort(limit: self.limit, offset: self.offset, isAes: false)
                }
            }
            
            HStack {
                MinButton(title: "size 升序", width: width) {
                    FileCase.sizeSort(limit: self.limit, offset: self.offset, isAes: true)
                }
                
                MinButton(title: "size 降序", width: width) {
                    FileCase.sizeSort(limit: self.limit, offset: self.offset, isAes: false)
                }
            }
        }
    }
}

struct FileSortView_Previews: PreviewProvider {
    static var previews: some View {
        FileSortView()
    }
}
