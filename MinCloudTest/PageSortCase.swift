//
//  PageSortCase.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/9.
//  Copyright © 2019 ifanr. All rights reserved.
//

import Foundation
import MinCloud

struct PageSortCase {
    static let table = Table(name: "ios_table")
    
    static func pageAes(limit: String, offset: String) {
        let limit = Int(limit) ?? 10
        let offset = Int(offset) ?? 0
        
        let query = Query()
        query.limit = limit
        query.offset = offset
        query.orderBy = ["created_at"]
        query.select = ["created_at"]
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func pageDes(limit: String, offset: String) {
        let limit = Int(limit) ?? 10
        let offset = Int(offset) ?? 0
        
        let query = Query()
        query.limit = limit
        query.offset = offset
        query.orderBy = ["-created_at"]
        query.select = ["created_at"]
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func select() {
        let query = Query()
        query.select = ["string", "integer"]
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func selectN() {
        let query = Query()
        query.select = ["-string", "-integer"]
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func expandAllRecords() {
        let query = Query()
        query.expand = ["created_by"]
        query.select = ["created_by"]
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func totalCount() {
        let query = Query()
        query.returnTotalCount = true
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
}
