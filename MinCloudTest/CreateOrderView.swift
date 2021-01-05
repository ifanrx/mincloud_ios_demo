//
//  CreateOrderView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/11.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI
let width = (UIScreen.main.bounds.width - 20)/2 - 10

struct CreateOrderView: View {
    
    @State fileprivate var merchandiseRecordId: String = ""
    @State fileprivate var merchandiseSchemaId: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("创建订单").foregroundColor(Color.red)
            
            TextField("输入 merchandise_record_id", text: $merchandiseRecordId).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("输入 merchandise_schema_id", text: $merchandiseSchemaId).textFieldStyle(RoundedBorderTextFieldStyle())
            HStack {
                
                MinButton(title: "微信(分账）", width: width) {
                    PaymentCase.wxPay(schemaID: self.merchandiseSchemaId, recordID: self.merchandiseRecordId, profitSharing: true)
                }
                
                MinButton(title: "微信(不分账）", width: width) {
                    PaymentCase.wxPay(schemaID: self.merchandiseSchemaId, recordID: self.merchandiseRecordId, profitSharing: false)
                }
                
                MinButton(title: "支付宝", width: width) {
                    PaymentCase.aliPay()
                }
            }
        }
    }
}

struct CreateOrderView_Previews: PreviewProvider {
    static var previews: some View {
        CreateOrderView()
    }
}
