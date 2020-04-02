//
//  ArrayQueryCase.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/9.
//  Copyright © 2019 ifanr. All rights reserved.
//

import Foundation
import MinCloud

struct ArrayQueryCase {
    static let table = Table(name: "ios_table")
    
    static func inList() {
        let whereArgs = Where.inList("string", list: ["abc", "edf"])
        let query = Query()
        query.where = whereArgs
        query.select = ["string"]
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func notInList() {
        let whereArgs = Where.notInList("string", list: ["edf", "jk"])
        let query = Query()
        query.where = whereArgs
        query.select = ["string"]
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func arrayContains() {
        let whereArgs = Where.arrayContains("arrayInt", list: [1, 2])
        let query = Query()
        query.where = whereArgs
        query.select = ["arrayInt"]
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func compare() {
        let whereArgs = Where.compare("arrayInt", operator: .equalTo, value: [1, 2, 3])
        let query = Query()
        query.where = whereArgs
        query.select = ["arrayInt"]
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
}
