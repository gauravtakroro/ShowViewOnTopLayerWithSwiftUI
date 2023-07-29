//
//  SceneDelegate.swift
//  ShowViewOnTopLayerWithSwiftUI
//
//  Created by Gaurav Tak on 29/07/23.
//
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
      
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        print("----- scene delegate -> scene willConnectTo")
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        print("----- scene delegate -> sceneDidDisconnect")
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        print("----- scene delegate -> sceneDidBecomeActive")
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        print("----- scene delegate -> sceneWillResignActive")
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        print("----- scene delegate -> sceneWillEnterForeground")
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        print("----- scene delegate -> sceneDidEnterBackground")
    }
}

