//
//  PaymentCase.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/11.
//  Copyright © 2019 ifanr. All rights reserved.
//

import Foundation
import MinCloud

struct PaymentCase {
    static func wxPay(schemaID: String? = nil, recordID: String? = nil) {
        Pay.shared.wxPay(totalCost: 0.01, merchandiseDescription: "微信", merchandiseSchemaID: schemaID, merchandiseRecordID: recordID) { (order, error) in
            setResult(order, error: error)
        }
    }
    
    static func aliPay(schemaID: String? = nil, recordID: String? = nil) {
        Pay.shared.aliPay(totalCost: 0.01, merchandiseDescription: "支付宝", merchandiseSchemaID: schemaID, merchandiseRecordID: recordID) { (order, error) in
            setResult(order, error: error)
        }
    }
    
    static func orderList(limit: String, offset: String) {
        let l = Int(limit) ?? 10
        let o = Int(offset) ?? 0
        let query = Query()
        query.limit = l
        query.offset = o
        Pay.shared.orderList(query: query) { (orderList, error) in
            setResult(orderList, error: error)
        }
    }
    
    static func orderList(status: OrderStatus) {
        let query = OrderQuery()
        query.status = status
        Pay.shared.orderList(query: query) { (orderList, error) in
            setResult(orderList, error: error)
        }
    }
    
    static func orderListRefund(status: RefundStatus) {
        let query = OrderQuery()
        query.refundStatus = status
        Pay.shared.orderList(query: query) { (orderList, error) in
            setResult(orderList, error: error)
        }
    }
    
    static func orderListType(type: GateWayType) {
        let query = OrderQuery()
        query.gateWayType = type
        Pay.shared.orderList(query: query) { (orderList, error) in
            setResult(orderList, error: error)
        }
    }
    
    static func tradeNo(no: String) {
        let query = OrderQuery()
        query.tradeNo = no
        Pay.shared.orderList(query: query) { (orderList, error) in
            setResult(orderList, error: error)
        }
    }
    
    static func transactionNo(no: String) {
        let query = OrderQuery()
        query.transactionNo = no
        Pay.shared.orderList(query: query) { (orderList, error) in
            setResult(orderList, error: error)
        }
    }
    
    static func merchandiseRecordId(id: String) {
        let query = OrderQuery()
        query.merchandiseRecordId = id
        Pay.shared.orderList(query: query) { (orderList, error) in
            setResult(orderList, error: error)
        }
    }
    
    static func merchandiseSchemaId(id: String) {
        let query = OrderQuery()
        query.merchandiseSchemaId = id
        Pay.shared.orderList(query: query) { (orderList, error) in
            setResult(orderList, error: error)
        }
    }
}
