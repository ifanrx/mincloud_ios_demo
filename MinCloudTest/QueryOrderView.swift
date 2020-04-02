//
//  QueryOrderView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/11.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct QueryOrderView: View {
    
    let width = (UIScreen.main.bounds.width - 20)/2 - 10
    
    @State fileprivate var tradeNo: String = ""
    @State fileprivate var transactionNo: String = ""
    @State fileprivate var merchandiseRecordId: String = ""
    @State fileprivate var merchandiseSchemaId: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("订单状态").foregroundColor(Color.red).padding(.top, 20)
            HStack {
                MinButton(title: "success", width: width) {
                    PaymentCase.orderList(status: .success)
                }
                
                MinButton(title: "pending", width: width) {
                    PaymentCase.orderList(status: .pending)
                }
            }
            
            Text("退款状态").foregroundColor(Color.red).padding(.top, 20)
            HStack {
                MinButton(title: "complete", width: width) {
                    PaymentCase.orderListRefund(status: .complete)
                }
                
                MinButton(title: "partial", width: width) {
                    PaymentCase.orderListRefund(status: .partial)
                }
            }
            
            Text("支付方式").foregroundColor(Color.red).padding(.top, 20)
            HStack {
                MinButton(title: "微信", width: width) {
                    PaymentCase.orderListType(type: .weixin)
                }
                
                MinButton(title: "支付宝", width: width) {
                    PaymentCase.orderListType(type: .alipay)
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                TextField("输入 trade_no", text: $tradeNo).textFieldStyle(RoundedBorderTextFieldStyle())
                MinButton(title: "按 trade_no 查询") {
                    PaymentCase.tradeNo(no: self.tradeNo)
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                TextField("输入 transaction_no", text: $transactionNo).textFieldStyle(RoundedBorderTextFieldStyle())
                MinButton(title: "按 transaction_no 查询") {
                    PaymentCase.transactionNo(no: self.transactionNo)
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                TextField("输入 merchandise_record_id", text: $merchandiseRecordId).textFieldStyle(RoundedBorderTextFieldStyle())
                MinButton(title: "按 merchandise_record_id 查询") {
                    PaymentCase.merchandiseRecordId(id: self.merchandiseRecordId)
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                TextField("输入 merchandise_schema_id", text: $merchandiseSchemaId).textFieldStyle(RoundedBorderTextFieldStyle())
                MinButton(title: "按 merchandise_schema_id 查询") {
                    PaymentCase.merchandiseSchemaId(id: self.merchandiseSchemaId)
                }
            }
            
            
        }
    }
}

struct QueryOrderView_Previews: PreviewProvider {
    static var previews: some View {
        QueryOrderView()
    }
}
