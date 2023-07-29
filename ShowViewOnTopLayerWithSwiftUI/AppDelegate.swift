//
//  AppDelegate.swift
//  ShowViewOnTopLayerWithSwiftUI
//
//  Created by Roro Solutions LLP on 29/07/23.
//


import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    
    static var orientationLock = UIInterfaceOrientationMask.portrait
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        print("AppDelegate application didFinishLaunchingWithOptions")
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }
    
}
