//
//  CompareCase.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/9.
//  Copyright © 2019 ifanr. All rights reserved.
//

import Foundation
import MinCloud

struct CompareCase {
    static let table = Table(name: "ios_table")
    
    static func equal() {
        let whereArgs = Where.compare("number", operator: .equalTo, value: 50)
        let query = Query()
        query.where = whereArgs
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func notEqualTo() {
        let whereArgs = Where.compare("number", operator: .notEqualTo, value: 50)
        let query = Query()
        query.where = whereArgs
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func greaterThan() {
        let whereArgs = Where.compare("number", operator: .greaterThan, value: 50)
        let query = Query()
        query.where = whereArgs
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func greaterThanOrEqualTo() {
        let whereArgs = Where.compare("number", operator: .greaterThanOrEqualTo, value: 50)
        let query = Query()
        query.where = whereArgs
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func lessThan() {
        let whereArgs = Where.compare("number", operator: .lessThan, value: 50)
        let query = Query()
        query.where = whereArgs
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func lessThanOrEqualTo() {
        let whereArgs = Where.compare("number", operator: .lessThanOrEqualTo, value: 50)
        let query = Query()
        query.where = whereArgs
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
}
