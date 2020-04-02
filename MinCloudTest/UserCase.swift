//
//  TestCase.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/6.
//  Copyright © 2019 ifanr. All rights reserved.
//

import Foundation
import MinCloud

struct UserCase {
    
    static var _currentUser: CurrentUser?
    
    static var currentUser: CurrentUser? {
        get {
            if _currentUser == nil {
                let error = NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey : "请登录"])

                GlobalStore.store.error = error
                GlobalStore.store.showMessage.toggle()
            }
            return _currentUser
        }
        
        set {
            _currentUser = newValue
        }
    }
    
    // 用户名注册
    static func register(name: String, pwd: String) {
        Auth.register(username: name, password: pwd) { (currentUser, error) in
            UserCase.currentUser = currentUser
            setResult(currentUser, error: error)
        }
    }
    
    // 邮箱注册
    static func register(email: String, pwd: String) {
        Auth.register(email: email, password: pwd) { (currentUser, error) in
            UserCase.currentUser = currentUser
            setResult(currentUser, error: error)
        }
    }
    
    // 用户登录
    static func login(name: String, pwd: String) {
        Auth.login(username: name, password: pwd) { (currentUser, error) in
            UserCase.currentUser = currentUser
            setResult(currentUser, error: error)
        }
    }
    
    // 邮箱登录
    static func login(email: String, pwd: String) {
        Auth.login(email: email, password: pwd) { (currentUser, error) in
            UserCase.currentUser = currentUser
            setResult(currentUser, error: error)
        }
    }
    
    // 匿名登录
    static func anonymousLogin() {
        Auth.anonymousLogin { (currentUser, error) in
            UserCase.currentUser = currentUser
            setResult(currentUser, error: error)
        }
    }
    
    static func signIn(with type: Provider, createUser: Bool, syncUserProfile: SyncUserProfileType) {
        Auth.signIn(with: .wechat, createUser: createUser, syncUserProfile: syncUserProfile) { (currentUser, error) in
            UserCase.currentUser = currentUser
            setResult(currentUser, error: error)
        }
        if WXApi.isWXAppInstalled() {
            Auth.signIn(with: .wechat, createUser: createUser, syncUserProfile: syncUserProfile) { (currentUser, error) in
                UserCase.currentUser = currentUser
                setResult(currentUser, error: error)
            }
        }
    }
    
    static func associate(with type: Provider, syncUserProfile: SyncUserProfileType) {
        Auth.associate(with: .wechat, syncUserProfile: syncUserProfile) { (currentUser, error) in
            UserCase.currentUser = currentUser
            setResult(currentUser, error: error)
        }
    }
    
    static func signInWithSMS(phone: String, code: String, createUser: Bool) {
        Auth.signInWithSMSVerificationCode(phone, code: code, createUser: createUser) { (currentUser, error) in
            UserCase.currentUser = currentUser
            setResult(currentUser, error: error)
        }
    }
    
    // 登出
    static func logout() {
        Auth.logout { (result, error) in
            UserCase.currentUser = nil
            setResult(result, error: error)
        }
    }
    
    // 获取当前用户
    static func getCurrentUser() {
        Auth.getCurrentUser { (currentUser, error) in
            setResult(currentUser, error: error)
        }
    }
    
    // 更新用户名
    static func updateUsername(_ name: String) {
        UserCase.currentUser?.updateUsername(name) { (result, error) in
                setResult(result, error: error)
        }
    }
    
    // 更新邮箱
    static func updateEmail(_ email: String) {
        UserCase.currentUser?.updateEmail(email) { (result, error) in
            setResult(result, error: error)
        }
    }
    
    // 更新密码
    static func updatePassword(_ pwd: String, newPwd: String) {
        UserCase.currentUser?.updatePassword(pwd, newPassword: newPwd) { (result, error) in
            setResult(result, error: error)
        }
    }
    
    // 更新内置字段
    static func updateUserInfo(city: String) {
        UserCase.currentUser?.updateUserInfo(["city": city]) { (result, error) in
            setResult(result, error: error)
        }
    }
    
    // 通过邮箱重置密码
    static func resetPassword(email: String) {
        UserCase.currentUser?.resetPassword(email: email) { (success, error) in
            setResult(["reuslt: \(success)"], error: error)
        }
    }
    
    //
    static func updatePhone(_ phone: String) {
        UserCase.currentUser?.updatePhone(phone) { (success, error) in
            setResult(["reuslt: \(success)"], error: error)
        }
    }
    
    static func verifyPhone(_ phone: String, code: String) {
        UserCase.currentUser?.updatePhone(phone, completion: { (result, error) in
            UserCase.currentUser?.verifyPhone(code: code, completion: { (success, error) in
                setResult(["reuslt: \(success)"], error: error)
            })
        })
    }
    
    // 邮箱验证
    static func emailVerify() {
        UserCase.currentUser?.requestEmailVerification() { (success, error) in
            setResult(["reuslt: \(success)"], error: error)
        }
    }
    
    static func getUser(id: String) {
        User.get(id) { (user, error) in
            setResult(user, error: error)
        }
    }
    
    static func getUserSelect(id: String, isSelect: Bool) {
        let select = isSelect ? "_username" : "-_username"
        User.get(id, select: [select]) { (user, error) in
            setResult(user, error: error)
        }
    }
    
    static func getUserExpand(id: String) {
        User.get(id, expand: ["pointer_test_order"]) { (user, error) in
            setResult(user, error: error)
        }
    }
    
    // Mark: 用户查询
    static func findUserList(limit: String, offset: String) {
        let l = Int(limit) ?? 10
        let o = Int(offset) ?? 0
        let query = Query()
        query.limit = l
        query.offset = o
        User.find(query: query) { (userList, error) in
            setResult(userList, error: error)
        }
    }
    
    static func orderByCreateAt(isAes: Bool) {
        let query = Query()
        let createdAt = isAes ? "created_at" : "-created_at"
        query.orderBy = [createdAt]
        User.find(query: query) { (userList, error) in
            setResult(userList, error: error)
        }
    }
    
    static func selectNickname(isSelect: Bool) {
        let query = Query()
        let select = isSelect ? "_username" : "-_username"
        query.select = [select]
        User.find(query: query) { (userList, error) in
            setResult(userList, error: error)
        }
    }
    
    static func expandPointer() {
        let whereArgs = Where.exists("pointer_test_order")
        let query = Query()
        query.expand = ["pointer_test_order"]
        query.select = ["pointer_test_order"]
        query.where = whereArgs
        User.find(query: query) { (userList, error) in
            setResult(userList, error: error)
        }
    }
    
    static func totalCount() {
        let query = Query()
        query.returnTotalCount = true
        User.find(query: query) { (userList, error) in
            setResult(userList, error: error)
        }
    }
}
