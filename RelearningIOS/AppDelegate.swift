//
//  AppDelegate.swift
//  RelearningIOS
//
//  Created by Hans Arijanto on 2020-01-25.
//  Copyright © 2020 Hans Arijanto. All rights reserved.
//

import UIKit
import PromiseKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    static let TARGET_COMPANY: Intrinio.CompanyType = Intrinio.CompanyType.apple
    
    let intrinioManager: Intrinio.Manager = Intrinio.Manager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        printDebug("Intrinio - Initializing Manager")
        printDebug("Intrinio - Fetching Apple")
        self.intrinioManager.get(company: Self.TARGET_COMPANY).done { data in
            printDebug(data);
            printDebug("Intrinio - Successfully Fetched Apple")
        }.catch { error in
            printDebug(error)
            printDebug("Intrinio - Error Fetching Apple")
        }
        
        self.intrinioManager.startTicking(company: Self.TARGET_COMPANY)
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


}

