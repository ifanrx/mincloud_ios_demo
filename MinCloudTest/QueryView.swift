//
//  QueryView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/9.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct QueryView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                
                GetQueryView()
                
                MinButton(title: "获取所有记录") {
                    QueryCase.getAllRecords()
                }.padding(.top, 24)
                
                // 比较查询
                CompareView()
                
                // 字符串查询
                StringQueryView()
                
                // 数组查询
                ArrayQueryView()
                
                //
                OtherQueryView()
                
                // 分页、排序、过滤、扩展
                PageSortView()
            }
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .navigationBarTitle("ios_table")
    }
}

struct QueryView_Previews: PreviewProvider {
    static var previews: some View {
        QueryView()
    }
}
