//
//  FileCategoryView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/11.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct FileCategoryView: View {
    private var limit: String = "10"
    private var offset: String = "0"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("文件分类").foregroundColor(Color.red).padding(.top, 20)
            
            MinButton(title: "获取 ‘ios_catagory’ 类的详情") {
                FileCase.getCategory()
            }
            
            MinButton(title: "获取所有分类") {
                FileCase.getCategoryList(limit: self.limit, offset: self.offset)
            }
            
            MinButton(title: "获取所有分类(totalCount)") {
                FileCase.CategoryListTotalCount()
            }
            
            MinButton(title: "ios_category 分类下所有内容") {
                FileCase.getFileListInCategory(limit: self.limit, offset: self.offset)
            }
        }
    }
}

struct FileCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        FileCategoryView()
    }
}
