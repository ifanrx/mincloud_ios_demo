//
//  EditCase.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/9.
//  Copyright © 2019 ifanr. All rights reserved.
//

import Foundation
import MinCloud

struct EditCase {
    
    static let table = Table(name: "ios_table")
    static var record: Record?
    
    // 一次设置
    static func createRecordSetAll(handler: @escaping () -> Void) {
        record = table.createRecord()
        let userTable = Table(name: "_userprofile")
        let user = userTable.getWithoutData(recordId: "93926364320105")
        let point = GeoPoint(longitude: 113.324850, latitude: 23.099826)
        let data = [[113.324850, 23.099826], [113.323952, 23.099907], [113.324020, 23.096730], [113.324850, 23.099826]]
        let polygon = GeoPolygon(coordinates: data)
        
        let file = File(dict: ["created_at": 1536551723, "id": "5b95eb2b020b013844460498", "mime_type": "image/jpeg", "name": "小程序_06.jpg", "path": "https://test-hydrogen-file.ifanrusercontent.com/1iCeAN5lSLdJ31lK", "size": 94436])
        
        var recordDict: [String : Any] = ["string": String.random(),
                        "integer": Int.random(),
                        "number": Float.random(),
                        "bool": Bool.random(),
                        "arrayInt": [Int.random(), Int.random(), Int.random()],
                        "arrayStr": [String.random(), String.random(), String.random()],
                        "arrayDate": [Date.curDate(), Date.curDate(), Date.curDate()],
                        "arrayObj": [["key1": 1], ["key2": 2], ["key3": 3]],
                        "object": ["key1": 1, "key2": "2", "key3": ["key33": 33]],
                        "date": Date.curDate(),
                        "pointer": user!,
                        "point": point,
                        "polygon": polygon,
                        "file": file!,
                        "arrayFile": [file!],
                        "arrayNum": [Float.random(), Float.random(), Float.random()],
                        "arrayBool": [Bool.random(), Bool.random()],
                        "arrayPoint": [point],
                        "arrayPolygon": [polygon],
                        "object_unset": ["key": "value"]
                        ]
        
        if Bool.random() {
            recordDict["unset"] = "unset"
        }
        
        if Bool.random() {
            recordDict["object"] = ["key1": 1, "key2": "2", "key3": ["key33": 33], "has_key": "has_key"]
        }
        
        record?.set(recordDict)
        record?.save(expand: ["pointer"], options: [RecordOptionKey.enableTrigger: true], completion: { (result, error) in
            setResult(record, error: error)
            if error == nil {
                handler()
            }
        })
    }
    
    // 逐个属性设置
    static func createRecordSetOne(handler: @escaping () -> Void) {
        record = table.createRecord()
        let point = GeoPoint(longitude: 113.324850, latitude: 23.099826)
        let data = [[113.324850, 23.099826], [113.323952, 23.099907], [113.324020, 23.096730], [113.324850, 23.099826]]
        let polygon = GeoPolygon(coordinates: data)
        
        let userTable = Table(name: "_userprofile")
        let user = userTable.getWithoutData(recordId: "93926364320105")
        record?.set("pointer", value: user!)
        record?.set("string", value: String.random())
        record?.set("integer", value: Int.random())
        record?.set("number", value: Float.random())
        record?.set("bool", value: Bool.random())
        record?.set("arrayInt", value: [Int.random(), Int.random(), Int.random()])
        record?.set("arrayStr", value: [String.random(), String.random(), String.random()])
        record?.set("arrayDate", value: [Date.curDate(), Date.curDate(), Date.curDate()])
        record?.set("arrayBool", value: [Bool.random(), Bool.random()])
        record?.set("arrayNum", value: [Float.random(), Float.random(), Float.random()])
        record?.set("arrayObj", value: [["key1": 1], ["key2": 2], ["key3": 3]])
        record?.set("object", value: ["key1": 1, "key2": "2", "key3": ["key33": 33]])
        record?.set("date", value: Date.curDate())
        record?.set("point", value: point)
        record?.set("polygon", value: polygon)
        let file = File(dict: ["created_at": 1536551723, "id": "5b95eb2b020b013844460498", "mime_type": "image/jpeg", "name": "小程序_06.jpg", "path": "https://test-hydrogen-file.ifanrusercontent.com/1iCeAN5lSLdJ31lK", "size": 94436])
        record?.set("file", value: file!)
        record?.set("arrayFile", value: [file!])
        record?.set("arrayPoint", value: [point])
        record?.set("arrayPolygon", value: [polygon])
        record?.set("object_unset", value: ["key": "value"])
        
        if Bool.random() {
            record?.set("unset", value: "unset")
        }
        
        if Bool.random() {
            record?.set("object", value: ["key1": 1, "key2": "2", "key3": ["key33": 33], "has_key": "has_key"])
        }
        record?.save { (result, error) in
            setResult(record, error: error)
            if error == nil {
                handler()
            }
        }
    }
    
    // 删除记录
    static func deleteRecord(handler:@escaping () -> Void) {
        record?.delete(options: [RecordOptionKey.enableTrigger: true], completion: { (result, error) in
            setResult(["result": result], error: error)
            if error == nil {
                record = nil
                handler()
            }
            
        })
    }
        
    // 更新 point
    static func updatePoint() {
        let point = GeoPoint(longitude: 113, latitude: 23)
        record?.set("point", value: point)
        record?.update { (result, error) in
            setResult(record, error: error)
        }
    }
    
    // 更新 polygon
    static func updatePolygon() {
        let data = [[113.0, 23.0], [114.0, 24.0], [115.0, 25.0],[113.0, 23.0]]
        let polygon = GeoPolygon(coordinates: data)
        record?.set("polygon", value: polygon)
        record?.update { (result, error) in
            setResult(record, error: error)
        }
    }
    
    // 更新 Pointer
    static func updatePointer(id: String) {
        let userTable = Table(name: "_userprofile")
        let user = userTable.getWithoutData(recordId: id)
        record?.set("pointer", value: user!)
        record?.update(completion: { (result, error) in
            setResult(record, error: error)
        })
    }
    
    // 原子减
    static func atomMinus() {
        record?.incrementBy("integer", value: -1)
        record?.update { (result, error) in
            setResult(record, error: error)
        }
    }
    
    // 原子加
    static func atomAdd() {
        record?.incrementBy("integer", value: 1)
        record?.update { (result, error) in
            setResult(record, error: error)
        }
    }
    
    // 更新
    static func atomUpdate() {
        record?.set("integer", value: 5)
        record?.update(expand: ["pointer"], options: [RecordOptionKey.enableTrigger: true], completion: { (result, error) in
            setResult(record, error: error)
        })
    }
    
    // 更新
    static func atomObjectincrementBy() {
        record?.incrementBy("object.key1", value: 3)
        record?.update { (result, error) in
            setResult(record, error: error)
        }
    }
    
    // 数组删除指定元素
    static func atomArrayMinus() {
        record?.remove("arrayInt", value: [1])
        record?.update { (result, error) in
            setResult(record, error: error)
        }
    }
    
    // 数组尾增加元素(可重复）
    static func atomArrayAppend() {
        record?.append("arrayInt", value: [3, 6])
        record?.update { (result, error) in
            setResult(record, error: error)
        }
    }

    
    // 将不存在数组的元素添加进去（已存在的元素被剔除）
    static func atomArrayUAppend() {
        record?.uAppend("arrayInt", value: [3, 5])
        record?.update { (result, error) in
            setResult(record, error: error)
        }
    }
    
    // 更新数组
    static func atomArrayUpdate() {
        record?.set("arrayInt", value: [1, 3])
        record?.update { (result, error) in
            setResult(record, error: error)
        }
    }
    
    // 删除最后一个元素
    static func atomArrayPop() {
        record?.pop("arrayInt")
        record?.update { (result, error) in
            setResult(record, error: error)
        }
    }
    
    // 删除第一个元素
    static func atomArrayShift() {
        record?.shift("arrayInt")
        record?.update { (result, error) in
            setResult(record, error: error)
        }
    }
    
    // 更新 Obj
    static func updateObj() {
        record?.set("object", value: ["new_key1": 1, "new_key2": 2])
        record?.update { (result, error) in
            setResult(record, error: error)
        }
    }
    
    static func updateFile() {
        FileManager().get("5d89799b55c8576939df94eb") { (file, error) in
            record?.set("file", value: file!)
            record?.update(completion:  { (success, error) in
                setResult(record, error: error)
            })
        }
        
    }
    
    // 更新 date
    static func updateDate() {
        record?.set("date", value: Date.curDate())
        record?.update { (result, error) in
            setResult(record, error: error)
        }
    }
    
    // 清空字段
    static func unset() {
        record?.unset("unset")
        record?.update { (result, error) in
            setResult(record, error: error)
        }
    }
    
    static func object_unset() {
        record?.unset("object_unset")
        record?.update(completion: { (result, error) in
            setResult(record, error: error)
        })
    }
}
