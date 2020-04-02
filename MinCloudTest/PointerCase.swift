//
//  PointerCase.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/10.
//  Copyright © 2019 ifanr. All rights reserved.
//

import Foundation
import MinCloud

struct PointerCase {
    static let table = Table(name: "ios_table")
    static var record: Record?
    
    static func createPointer(id: String) {
        record = table.createRecord()
        let userTable = Table(name: "_userprofile")
        let user = userTable.getWithoutData(recordId: id)
        record?.set("pointer", value: user)
        record?.save({ (result, error) in
            setResult(record, error: error)
        })
    }
    
    static func queryPointer(id: String) {
        let userTable = Table(name: "_userprofile")
        let user = userTable.getWithoutData(recordId: id)
        let whereArgs = Where.compare("pointer", operator: .equalTo, value: user)
        let query = Query()
        query.where = whereArgs
        table.find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
}
