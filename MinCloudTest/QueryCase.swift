//
//  QueryCase.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/10.
//  Copyright © 2019 ifanr. All rights reserved.
//

import Foundation
import MinCloud

struct QueryCase {
    static let table = Table(name: "ios_table")

    static func getRecord(_ id: String) {
        table.get(id) { (record, error) in
            setResult(record, error: error)
        }
    }
    
    static func getRecordSelect(id: String) {
        table.get(id, select: ["string"]) { (record, error) in
            setResult(record, error: error)
        }
    }
    
    static func getRecordNSelect(id: String) {
        table.get(id, select: ["-string"]) { (record, error) in
            setResult(record, error: error)
        }
    }
    
    static func getRecordExpand(id: String) {
        table.get(id, expand: ["created_by"]) { (record, error) in
            setResult(record, error: error)
        }
    }
    
    static func getAllRecords() {
        table.find { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
}
