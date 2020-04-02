//
//  BaaSCase.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/11.
//  Copyright © 2019 ifanr. All rights reserved.
//

import Foundation
import MinCloud

struct BaaSCase {
    static func invoke() {
        BaaS.invoke(name: "ios_helloworld", data: ["name": "MinCloud"], sync: true) { (result, error) in
            setResult(result, error: error)
        }
    }
    
    static func sendSmsCode(phone: String) {
        BaaS.sendSmsCode(phone: phone) { (success, error) in
            setResult(["result: \(success)"], error: error)
        }
    }
    
    static func verifySmsCode(phone: String, code: String) {
        BaaS.verifySmsCode(phone: phone, code: code) { (success, error) in
            setResult(["result: \(success)"], error: error)
        }
    }
    
    static func getServerTime() {
        BaaS.getServerTime { (result, error) in
            setResult(result, error: error)
        }
    }
}
