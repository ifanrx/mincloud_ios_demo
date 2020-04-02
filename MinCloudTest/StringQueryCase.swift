//
//  StringQueryCase.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/9.
//  Copyright © 2019 ifanr. All rights reserved.
//

import Foundation
import MinCloud

struct StringQueryCase {
    static let table = Table(name: "ios_table")
    
    static func contains() {
        let whereArgs = Where.contains("string", value: "edf")
        let query = Query()
        query.where = whereArgs
        query.select = ["string"]
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func icontains() {
        let whereArgs = Where.icontains("string", value: "edf")
        let query = Query()
        query.where = whereArgs
        query.select = ["string"]
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    static func regexString() {
        let regExp = "/^ed"
        let whereArgs = Where.matches("string", regx: regExp)
        let query = Query()
        query.where = whereArgs
        query.select = ["string"]
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
}
