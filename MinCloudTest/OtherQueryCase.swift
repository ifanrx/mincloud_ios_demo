//
//  OtherQueryCase.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/9.
//  Copyright © 2019 ifanr. All rights reserved.
//

import Foundation
import MinCloud

struct OtherQueryCase {
    static let table = Table(name: "ios_table")
    
    static func isNull() {
        let whereArgs = Where.isNull("unset")
        let query = Query()
        query.where = whereArgs
        query.select = ["unset"]
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }

    static func isNotNull() {
        let whereArgs = Where.isNotNull("unset")
        let query = Query()
        query.where = whereArgs
        query.select = ["unset"]
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func exists() {
        let whereArgs = Where.exists("unset")
        let query = Query()
        query.where = whereArgs
        query.select = ["unset"]
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func notExists() {
        let whereArgs = Where.notExists("unset")
        let query = Query()
        query.where = whereArgs
        query.select = ["unset"]
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func hasKey() {
        let whereArgs = Where.hasKey("object", fieldName: "has_key")
        let query = Query()
        query.where = whereArgs
        query.select = ["object"]
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func combination() {
        let whereArgs1 = Where.compare("integer", operator: .lessThanOrEqualTo, value: 7)
        let whereArgs2 = Where.compare("integer", operator: .greaterThanOrEqualTo, value: 3)
        let whereArgs = Where.and([whereArgs1, whereArgs2])
        let query = Query()
        query.where = whereArgs
        query.select = ["integer"]
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }

}
