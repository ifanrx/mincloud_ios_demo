//
//  extension.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/10.
//  Copyright © 2019 ifanr. All rights reserved.
//

import Foundation

let strList = ["abc", "edf", "eDF", "EDF", "ghi", "jkl", "xyz"]
let boolList = [true, false]

public extension Float {
    static func randomFloatNumber(lower: Float = 0,upper: Float = 100) -> Float {
        return (Float(arc4random()) / Float(UInt32.max)) * (upper - lower) + lower
    }
    
    static func random() -> Float {
        randomFloatNumber(lower: 0, upper: 100)
    }
}

public extension Int {
    static func randomIntNumber(lower: Int = 0,upper: Int = Int(UInt32.max)) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower)))
    }

    static func randomIntNumber(range: Range<Int>) -> Int {
        return randomIntNumber(lower: range.lowerBound, upper: range.upperBound)
    }
    
    static func random() -> Int {
        return randomIntNumber(lower: 0, upper: 10)
    }
}

public extension String {
    static func random() -> String {
        let index = Int.randomIntNumber(lower: 0, upper: strList.count)
        return strList[index]
    }
}

public extension Bool {
    static func random() -> Bool {
        let index = Int.randomIntNumber(lower: 0, upper: boolList.count)
        return boolList[index]
    }
}

public extension Date {
    static func curDate() -> String {
        return ISO8601DateFormatter().string(from: Date())
    }
}
