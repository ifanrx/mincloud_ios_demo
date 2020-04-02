//
//  ContentCategoryView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/11.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct ContentCategoryView: View {
    private var limit: String = "10"
    private var offset: String = "0"
    @State private var categoryId: String = "1569304524818373"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("内容库分类").foregroundColor(Color.red).padding(.top, 20)
            
            TextField("内容分类id", text: $categoryId).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.top, 20)
            MinButton(title: "内容分类详情") {
                ContentCase.getCategory(id: self.categoryId)
            }
            
            MinButton(title: "获取所有分类") {
                ContentCase.getCategoryList(limit: self.limit, offset: self.offset)
            }
            
            MinButton(title: "获取所有分类(totalCount)") {
                ContentCase.getCategoryListTotalCount()
            }
            
            MinButton(title: "文学 分类下所有内容") {
                ContentCase.contentListInCategory(limit: self.limit, offset: self.offset)
            }
        }
    }
}

struct ContentCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ContentCategoryView()
    }
}
