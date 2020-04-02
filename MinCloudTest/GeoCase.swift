//
//  GeoCase.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/9.
//  Copyright © 2019 ifanr. All rights reserved.
//

import Foundation
import MinCloud

struct GeoCase {
    
    static let communityTable = Table(name: "ios_community_geo")
    static let hotelTable = Table(name: "ios_hotel_geo")
    
    static func include() {
        // 查找当前用户所属小区
        
        
        // geoField 为 neighbourhood 表中定义地理位置的字段名，point 为用户所在位置，为 GeoPoint 类型
        let whereArgs = Where.include("polygon", point: GeoPoint(longitude: 113.331368, latitude: 23.105036))
        let query = Query()
        query.where = whereArgs
        communityTable.find(query: query, completion: {listResult, error in
            setResult(listResult, error: error)
        })
    }
    
    static func withinCircle() {

        let whereArgs = Where.withinCircle("point", point: GeoPoint(longitude: 113.331368, latitude: 23.105036), radius: 1.0)
        let query = Query()
        query.where = whereArgs
        hotelTable.find(query: query, completion: {listResult, error in
            setResult(listResult, error: error)
        })
    }
    
    static func withinRegion() {

        let whereArgs = Where.withinRegion("point", point: GeoPoint(longitude: 113.331368, latitude: 23.105036), minDistance: 0.3, maxDistance: 1.0)
        let query = Query()
        query.where = whereArgs
        hotelTable.find(query: query, completion: {listResult, error in
            setResult(listResult, error: error)
        })
    }
    
    static func within() {

        let whereArgs = Where.within("point", polygon: GeoPolygon(coordinates: [[113.330488,23.102177],[113.333829,23.102277],[113.333703,23.107595],[113.331997,23.107678],[113.330362,23.1057],[113.330488,23.102177]]))
        let query = Query()
        query.where = whereArgs
        hotelTable.find(query: query, completion: {listResult, error in
            setResult(listResult, error: error)
        })
    }
}
