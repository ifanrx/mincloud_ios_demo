//
//  AppDelegate.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/5.
//  Copyright © 2019 ifanr. All rights reserved.
//

import UIKit
import MinCloud

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        BaaS.register(clientID: "a4d2d62965ddb57fa4d6")
        BaaS.registerWechat("wx4b3c1aff4c5389f5")
        BaaS.isDebug = true
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return BaaS.handleOpenURL(url: url)
    }
    
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        return BaaS.handleOpenURL(url: url)
    }

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return BaaS.handleOpenURL(url: url)
    }
}

