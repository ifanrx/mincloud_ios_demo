//
//  BatchView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/10.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct BatchView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                Text("批量创建").foregroundColor(Color.red).padding(.top, 20)
                MinButton(title: "创建(触发触发器)") {
                    BatchCase.batchCreate(enable_trigger: true)
                }
                MinButton(title: "创建(不触发触发器)") {
                    BatchCase.batchCreate(enable_trigger: false)
                }
                
                Text("批量更新：将 bool 为 true 的记录的 date 设为当前日期").font(.system(size: 14)).foregroundColor(Color.red).padding(.top, 20)
                MinButton(title: "更新(触发触发器)") {
                    BatchCase.batchUpdate(enable_trigger: true)
                }
                MinButton(title: "更新(不触发触发器)") {
                    BatchCase.batchUpdate(enable_trigger: false)
                }
                MinButton(title: "批量更新(TotalCount)") {
                    BatchCase.batchUpdateTotalCount(enable_trigger: false)
                }
                
                Text("批量删除：删除 bool 为 true 的记录").foregroundColor(Color.red).padding(.top, 20)
                VStack(alignment: .leading, spacing: 5) {
                    MinButton(title: "删除(触发触发器)") {
                        BatchCase.batchDelete(enable_trigger: true)
                    }
                    MinButton(title: "删除(不触发触发器)") {
                        BatchCase.batchDelete(enable_trigger: false)
                    }
                    
                    MinButton(title: "批量删除(totalCount)") {
                        BatchCase.batchDeleteTotalCount(enable_trigger: false)
                    }
                }
            }
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .navigationBarTitle("ios_table")
    }
}

struct BatchView_Previews: PreviewProvider {
    static var previews: some View {
        BatchView()
    }
}
