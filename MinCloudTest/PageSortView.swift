//
//  PageSortView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/10.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct PageSortView: View {
    @State private var limit: String = "10"
    @State private var offset: String = "0"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("分页与排序").foregroundColor(Color.red).padding(.top, 20)
            HStack {
                Text("limit")
                TextField("limit", text: $limit).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack {
                Text("offset")
                TextField("offset", text: $offset).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            MinButton(title: "creatd_at 升序") {
                PageSortCase.pageAes(limit: self.limit, offset: self.offset)
            }
            MinButton(title: "created_at 降序") {
                PageSortCase.pageDes(limit: self.limit, offset: self.offset)
            }
            
            Text("字段过滤与扩展").foregroundColor(Color.red).padding(.top, 20)
            MinButton(title: "返回 string 和 integer 属性") {
                PageSortCase.select()
            }
            MinButton(title: "不返回 string 和 integer 属性") {
                PageSortCase.selectN()
            }
            MinButton(title: "扩展 created_by") {
                PageSortCase.expandAllRecords()
            }
            
            MinButton(title: "获取 totalCount") {
                PageSortCase.totalCount()
            }
            
            
            
        }
    }
}

struct PageSortView_Previews: PreviewProvider {
    static var previews: some View {
        PageSortView()
    }
}
