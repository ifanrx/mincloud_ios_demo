//
//  SchemaEidtView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/9.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct SchemaEidtView: View {
    @State private var valid = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                Text("请先创建一条记录，再进行下一步操作")
                    .foregroundColor(Color.red)
                MinButton(title: "添加记录(整体 set), expand pointer/触发") {
                    EditCase.createRecordSetAll {
                        self.valid = true
                    }
                }
                
                MinButton(title: "添加记录(单独 set)") {
                    EditCase.createRecordSetOne {
                        self.valid = true
                    }
                }

                MinButton(title: "删除记录(触发)", background: Color.clear) {
                    EditCase.deleteRecord {
                        self.valid = false
                    }
                }
                .background(valid ? Color.green : Color.gray)
                .disabled(!valid)
                
                AtomView(valid: $valid)
                
                PointerView(valid: $valid)

                OtherEidtView(valid: $valid)
                
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .navigationBarTitle("ios_table")
        }
        
        
    }
}

struct SchemaEidtView_Previews: PreviewProvider {
    static var previews: some View {
        SchemaEidtView()
    }
}
