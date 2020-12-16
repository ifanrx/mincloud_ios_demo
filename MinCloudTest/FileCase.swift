//
//  FileCase.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/9.
//  Copyright © 2019 ifanr. All rights reserved.
//

import Foundation
import MinCloud

struct FileCase {
    
    static var file: File?
    
    static func uploadFile(handler: @escaping () -> Void) {
        let filePath = Bundle.main.path(forResource: "meitu", ofType: "jpg")
        FileManager().upload(filename: "ifanr", localPath: filePath!, categoryName: "ios_category",
                           progressBlock: { progress in print("\(String(describing: progress?.fractionCompleted))") },
                           completion: {file, error in
                            self.file = file
                            setResult(file, error: error)
                            if error == nil {
                                handler()
                            }
        })
    }
    
    static func uploadBigFile(handler: @escaping () -> Void) {
        let filePath = Bundle.main.path(forResource: "bigfile.zip", ofType: nil)
        FileManager().upload(filename: "ifanr", localPath: filePath!, mimeType: "application/zip",
                           progressBlock: { progress in print("\(String(describing: progress?.fractionCompleted))") },
                           completion: {file, error in
                            self.file = file
                            setResult(file, error: error)
                            if error == nil {
                                handler()
                            }
        })
    }
    
    static func uploadFile_Data(handler: @escaping () -> Void) {
        let imageData = UIImage(named: "meitu")?.pngData()
        FileManager().upload(filename: "ifanr", fileData: imageData!, mimeType: "image/png", categoryName: "ios_category",
                           progressBlock: { progress in print("\(String(describing: progress?.fractionCompleted))") },
                           completion: {file, error in
                            self.file = file
                            setResult(file, error: error)
                            if error == nil {
                                handler()
                            }
        })
    }
    
    static func deleteFile(handler: @escaping () -> Void) {
        file?.delete({ (success, error) in
            if success {
                self.file = nil
                handler()
            }
            setResult(["result: \(success)"], error: error)
        })
    }
    
    static func deleteFiles(files: [String]) {
        FileManager().delete(files) { (success, error) in
            setResult(["result: \(success)"], error: error)
        }
    }
    
    static func getFile() {
        if let file = file {
            FileManager().get(file.Id!) { (fileInfo, error) in
                setResult(fileInfo, error: error)
            }
        }
        
    }
    
    static func getFileList(limit: String, offset: String) {
        let l = Int(limit) ?? 10
        let o = Int(offset) ?? 0
        let query = Query()
        query.limit = l
        query.offset = o
        FileManager().find(query: query) { (fileList, error) in
            setResult(fileList, error: error)
        }
    }
    
    static func getCategory() {
        FileManager().getCategory("5d89b531619f0641755294b1") { (category, error) in
            setResult(category, error: error)
        }
    }
    
    static func getCategoryList(limit: String, offset: String) {
        let l = Int(limit) ?? 10
        let o = Int(offset) ?? 0
        let query = Query()
        query.limit = l
        query.offset = o
        FileManager().getCategoryList(query: query) { (categoryList, error) in
            setResult(categoryList, error: error)
        }
    }
    
    static func CategoryListTotalCount() {
        let query = Query()
        query.returnTotalCount = true
        FileManager().getCategoryList(query: query) { (categoryList, error) in
            setResult(categoryList, error: error)
        }
    }
    
    static func getFileListInCategory(limit: String, offset: String) {
        let l = Int(limit) ?? 10
        let o = Int(offset) ?? 0
        let query = Query()
        query.limit = l
        query.offset = o
        FileManager().find(categoryId: "5d89b531619f0641755294b1", query: query) { (fileList, error) in
            setResult(fileList, error: error)
        }
    }
    
    // MARK: 排序
    
    static func createdAtSort(limit: String, offset: String, isAes: Bool) {
        let l = Int(limit) ?? 10
        let o = Int(offset) ?? 0
        let query = Query()
        query.limit = l
        query.offset = o
        let createdOrder = isAes ? "created_at" : "-created_at"
        query.orderBy = [createdOrder]
        query.select = ["created_at"]
        FileManager().find(query: query) { (fileList, error) in
            setResult(fileList, error: error)
        }
    }
    
    static func sizeSort(limit: String, offset: String, isAes: Bool) {
        let l = Int(limit) ?? 10
        let o = Int(offset) ?? 0
        let query = Query()
        query.limit = l
        query.offset = o
        query.select = ["size"]
        let sizeOrder = isAes ? "size" : "-size"
        query.orderBy = [sizeOrder]
        FileManager().find(query: query) { (fileList, error) in
            setResult(fileList, error: error)
        }
    }
    
    static func nameSort(limit: String, offset: String, isAes: Bool) {
        let l = Int(limit) ?? 10
        let o = Int(offset) ?? 0
        let query = Query()
        query.limit = l
        query.offset = o
        let nameOrder = isAes ? "name" : "-name"
        query.orderBy = [nameOrder]
        query.select = ["name"]
        FileManager().find(query: query) { (fileList, error) in
            setResult(fileList, error: error)
        }
    }
    
    // MARK: 查询, 只支持对 id，name，size，category_id，category_name，created_at 查询
    static func idEqual(id: String) {
        let whereArgs = Where.compare("id", operator: .equalTo, value: id)
        let query = Query()
        query.where = whereArgs
        FileManager().find(query: query) { (fileList, error) in
            setResult(fileList, error: error)
        }
    }
    
    static func nameQuery(op: Operator) {
        let whereArgs = Where.compare("name", operator: op, value: "ifanr")
        let query = Query()
        query.where = whereArgs
        FileManager().find(query: query) { (contentList, error) in
            setResult(contentList, error: error)
        }
    }
    
    static func sizeQuery(op: Operator, size: Float) {
        let whereArgs = Where.compare("size", operator: op, value: size)
        let query = Query()
        query.where = whereArgs
        FileManager().find(query: query) { (contentList, error) in
            setResult(contentList, error: error)
        }
    }
    
    static func categoryIdE(id: String) {
        let whereArgs = Where.compare("category_id", operator: .equalTo, value: id)
        let query = Query()
        query.where = whereArgs
        FileManager().find(query: query) { (fileList, error) in
            setResult(fileList, error: error)
        }
    }
    
    static func createdAtQuery(op: Operator) {
        let whereArgs = Where.compare("created_at", operator: op, value: Date().timeIntervalSinceReferenceDate)
        let query = Query()
        query.where = whereArgs
        FileManager().find(query: query) { (fileList, error) in
            setResult(fileList, error: error)
        }
    }
    
    static func fileTotalCount() {
        let query = Query()
        query.returnTotalCount = true
        FileManager().find(query: query) { (recordList, error) in
            setResult(recordList, error: error)
        }
    }
    
    // Mark 分类
    static func categoryName(op: Operator, name: String) {
        let whereArgs = Where.compare("category_name", operator: op, value: name)
        let query = Query()
        query.where = whereArgs
        FileManager().find(query: query) { (fileList, error) in
            setResult(fileList, error: error)
        }
    }
    
    static func categoryNameSort(limit: String, offset: String, isAes: Bool) {
        let l = Int(limit) ?? 10
        let o = Int(offset) ?? 0
        let query = Query()
        query.limit = l
        query.offset = o
        let nameOrder = isAes ? "name" : "-name"
        query.orderBy = [nameOrder]
        FileManager().find(query: query) { (contentList, error) in
            setResult(contentList, error: error)
        }
    }
    
    static func genVideoSnapshot() {
        let params: [String: Any] = ["source": "5c4a6db320fa9c2e054c6c36",
                                      "save_as": "ios_snapshot.png",
                                      "point": "00:00:10",
                                      "category_id": "5d89b531619f0641755294b1",
                                      "random_file_link": false]
        FileManager().genVideoSnapshot(params) { (result, error) in
            setResult(result, error: error)
        }
    }
    
    static func videoConcat() {
        let params: [String: Any] = ["m3u8s": ["5c4a699820fa9c27f14c6ddd", "5c4a685520fa9c27f14c6d48", "5c453c7cfe10833f3178479e"],
                                     "save_as": "ios_concat.m3u8",
                                     "category_id": "5d89b531619f0641755294b1",
                                     "random_file_link": false]
        FileManager().videoConcat(params) { (result, error) in
            setResult(result, error: error)
        }
    }
    
    static func videoClip() {
        let params: [String: Any] = ["m3u8": "5c452bebfe10832bf97846c9",
                                     "include": [0, 20],
                                    "save_as": "ios_0s_20s.m3u8",
                                    "category_id": "5d89b531619f0641755294b1",
                                    "random_file_link": false]
        FileManager().videoClip(params) { (result, error) in
            setResult(result, error: error)
        }
    }
    
    static func videoMeta() {
        FileManager().videoMeta("5c452bebfe10832bf97846c9") { (result, error) in
            setResult(result, error: error)
        }
    }
    
    static func videoAudioMeta() {
        FileManager().videoAudioMeta("5c452bd5fe10832af07846f1") { (result, error) in
            setResult(result, error: error)
        }
    }
}
