//
//  BatchCase.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/9.
//  Copyright © 2019 ifanr. All rights reserved.
//

import Foundation
import MinCloud

struct BatchCase {
    static let table = Table(name: "ios_table")
    
    static func CreateRecordDict() -> [String: Any] {
        let recordDict: [String: Any] = [
                        "string": String.random(),
                        "integer": Int.random(),
                        "number": Float.random(),
                        "bool": Bool.random(),
                        "arrayInt": [1, 2, 3],
                        "arrayStr": [String.random(), String.random(), String.random()],
                        "arrayDate": [Date.curDate(), Date.curDate(), Date.curDate()],
                        "arrayObj": [["key1": 1], ["key2": 2], ["key3": 3]],
                        "object": ["key1": 1, "key2": "2", "key3": ["key33": 33]],
                        "date": Date.curDate(),
                        ]
        return recordDict
    }
    
    static func batchCreate(enable_trigger: Bool) {
        let options = ["enable_trigger": enable_trigger]
        
        table.createMany([CreateRecordDict(),
                          CreateRecordDict()], options: options) { (result, error) in
            setResult(result, error: error)
        }
    }
    
    static func batchUpdate(enable_trigger: Bool) {
        let options = ["enable_trigger": enable_trigger]
        let record = table.createRecord()
        record.set("date", value: Date.curDate())
        let whereArgs = Where.compare("bool", operator: .equalTo, value: true)
        let query = Query()
        query.where = whereArgs
        table.update(record: record, query: query, options: options) { (result, error) in
            setResult(result, error: error)
        }
    }
    
    static func batchUpdateTotalCount(enable_trigger: Bool) {
        let options = ["enable_trigger": enable_trigger]
        let record = table.createRecord()
        record.set("date", value: Date.curDate())
        let whereArgs = Where.compare("bool", operator: .equalTo, value: true)
        let query = Query()
        query.where = whereArgs
        query.returnTotalCount = true
        table.update(record: record, query: query, options: options) { (result, error) in
            setResult(result, error: error)
        }
    }
    
    static func batchDelete(enable_trigger: Bool) {
        let options = ["enable_trigger": enable_trigger]
        let whereArgs = Where.compare("bool", operator: .equalTo, value: true)
        let query = Query()
        query.where = whereArgs
        table.delete(query: query, options: options) { (result, error) in
            setResult(result, error: error)
        }
    }
    
    static func batchDeleteTotalCount(enable_trigger: Bool) {
        let options = ["enable_trigger": enable_trigger]
        let whereArgs = Where.compare("bool", operator: .equalTo, value: false)
        let query = Query()
        query.where = whereArgs
        query.returnTotalCount = true
        table.delete(query: query, options: options) { (result, error) in
            setResult(result, error: error)
        }
    }
}
