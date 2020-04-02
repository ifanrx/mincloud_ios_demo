//
//  ContentCase.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/9.
//  Copyright © 2019 ifanr. All rights reserved.
//

import Foundation
import MinCloud

struct ContentCase {
    
    static let contentGroup = ContentGroup(Id: "1569304505991811")

    
    static func getContent(id: String) {
        contentGroup.get(id) { (content, error) in
            setResult(content, error: error)
        }
    }
    
    static func getCategory(id: String) {
        contentGroup.getCategory(id) { (category, error) in
            setResult(category, error: error)
        }
    }
    
    static func getCategoryList(limit: String, offset: String) {
        let l = Int(limit) ?? 10
        let o = Int(offset) ?? 0
        let query = Query()
        query.limit = l
        query.offset = o
        contentGroup.getCategoryList(query: query) { (categoryList, error) in
            setResult(categoryList, error: error)
        }
    }
    
    static func getCategoryListTotalCount() {

        let query = Query()
        query.returnTotalCount = true
        contentGroup.getCategoryList(query: query) { (categoryList, error) in
            setResult(categoryList, error: error)
        }
    }
    
    static func getContentList(limit: String, offset: String) {
        let l = Int(limit) ?? 10
        let o = Int(offset) ?? 0
        let query = Query()
        query.limit = l
        query.offset = o
        contentGroup.find(query: query) { (contentList, error) in
            setResult(contentList, error: error)
        }
    }
    
    static func getContentListTotalCount() {

        let query = Query()
        query.returnTotalCount = true
        contentGroup.find(query: query) { (contentList, error) in
            setResult(contentList, error: error)
        }
    }
    
    static func contentListInCategory(limit: String, offset: String) {
        let l = Int(limit) ?? 10
        let o = Int(offset) ?? 0
        let query = Query()
        query.limit = l
        query.offset = o
        contentGroup.find(categoryId: "1569304524818373", query: query) { (contentList, error) in
            setResult(contentList, error: error)
        }
    }
    
    static func createAtAes(limit: String, offset: String) {
        let l = Int(limit) ?? 10
        let o = Int(offset) ?? 0
        let query = Query()
        query.limit = l
        query.offset = o
        query.orderBy = ["created_at"]
        query.select = ["created_at"]
        contentGroup.find(query: query) { (contentList, error) in
            setResult(contentList, error: error)
        }
        
    }
    
    static func createAtDes(limit: String, offset: String) {
        let l = Int(limit) ?? 10
        let o = Int(offset) ?? 0
        let query = Query()
        query.limit = l
        query.offset = o
        query.orderBy = ["-created_at"]
        query.select = ["created_at"]
        contentGroup.find(query: query) { (contentList, error) in
            setResult(contentList, error: error)
        }
    }
    
    static func titleEqual() {
        let whereArgs = Where.compare("title", operator: .equalTo, value: "content1")
        let query = Query()
        query.where = whereArgs
        contentGroup.find(query: query) { (contentList, error) in
            setResult(contentList, error: error)
        }
    }
    
    static func titleNotEqual() {
        let whereArgs = Where.compare("title", operator: .notEqualTo, value: "content1")
        let query = Query()
        query.where = whereArgs
        contentGroup.find(query: query) { (contentList, error) in
            setResult(contentList, error: error)
        }
    }
    
    static func select() {
        let query = Query()
        query.select = ["title"]
        contentGroup.find(query: query) { (contentList, error) in
            setResult(contentList, error: error)
        }
    }
    
    static func selectN() {
        let query = Query()
        query.select = ["-title"]
        contentGroup.find(query: query) { (contentList, error) in
            setResult(contentList, error: error)
        }
    }
}
