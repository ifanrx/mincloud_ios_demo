//
//  WampCase.swift
//  MinCloudTest
//
//  Created by quanhua on 2020/11/12.
//  Copyright © 2020 ifanr. All rights reserved.
//

import Foundation
import MinCloud

class WampCase {
    
    static let shared = WampCase()
    var createSubscription: Subscription?
    var deleteSubscription: Subscription?
    var updateSubscription: Subscription?
    
    func subscribeCreate() {
        let danmuTable = Table(name: "danmu")
        danmuTable.subscribe(.onCreate) { (subscription) in
            setResult("订阅成功", error: nil)
            self.createSubscription = subscription
        } onError: { error in
            setResult(nil, error: error)
            print("error: \(error?.localizedDescription ?? "")")
        } onEvent: { (result) in
            setResult(result, error: nil)
            print("result: \(result ?? [:])")
        }
    }
    
    func unSubscribeCreate() {
        createSubscription?.unsubscribe(onSuccess: {
            setResult("取消成功", error: nil)
        }, onError: { (error) in
            setResult(nil, error: error)
            print("error: \(error?.localizedDescription ?? "")")
        })
    }
    
    func subscribeDelete() {
        let danmuTable = Table(name: "danmu")
        danmuTable.subscribe(.onDelete) { (subscription) in
            self.deleteSubscription = subscription
            setResult("订阅成功", error: nil)
        } onError: { error in
            setResult(nil, error: error)
            print("error: \(error?.localizedDescription ?? "")")
        } onEvent: { (result) in
            setResult(result, error: nil)
            print("result: \(result ?? [:])")
        }
    }
    
    func unSubscribeDelete() {
        self.deleteSubscription?.unsubscribe(onSuccess: {
            setResult("取消成功", error: nil)
        }, onError: { (error) in
            setResult(nil, error: error)
            print("error: \(error?.localizedDescription ?? "")")
        })
    }
    
    func subscribeUpdate() {
        let danmuTable = Table(name: "danmu")
        danmuTable.subscribe(.onUpdate, where: Where.compare("desc", operator: .equalTo, value: "更新")) { (subscription) in
            self.updateSubscription = subscription
            setResult("订阅成功", error: nil)
        } onError: { error in
            setResult(nil, error: error)
            print("error: \(error?.localizedDescription ?? "")")
        } onEvent: { (result) in
            setResult(result, error: nil)
            print("result: \(result ?? [:])")
        }
    }
    
    func unSubscribeUpdate() {
        self.updateSubscription?.unsubscribe(onSuccess: {
            setResult("取消成功", error: nil)
        }, onError: { (error) in
            setResult(nil, error: error)
            print("error: \(error?.localizedDescription ?? "")")
        })
    }
    
    func subscribeSchemeNotExists() {
        let danmuTable = Table(name: "弹幕")
        danmuTable.subscribe(.onUpdate, where: Where.compare("desc", operator: .equalTo, value: "更新")) { (subscription) in
            self.updateSubscription = subscription
            setResult("订阅成功", error: nil)
        } onError: { error in
            setResult(nil, error: error)
            print("error: \(error?.localizedDescription ?? "")")
        } onEvent: { (result) in
            setResult(result, error: nil)
            print("result: \(result ?? [:])")
        }
    }
    
    func subscribeInvalidEvent() {
        let danmuTable = Table(name: "danmu")
        danmuTable.subscribe(.onUpdate, where: Where.compare("notExists", operator: .equalTo, value: "更新")) { (subscription) in
            self.updateSubscription = subscription
            setResult("订阅成功", error: nil)
        } onError: { error in
            setResult(nil, error: error)
            print("error: \(error?.localizedDescription ?? "")")
        } onEvent: { (result) in
            setResult(result, error: nil)
            print("result: \(result ?? [:])")
        }
    }
    
}
