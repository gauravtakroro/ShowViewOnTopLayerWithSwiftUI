//
//  SceneDelegate.swift
//  ShowViewOnTopLayerWithSwiftUI
//
//  Created by Gaurav Tak on 29/07/23.
//

import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var alertViewWindow: UIWindow?
    var progressLoaderWindow: UIWindow?
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        print("----- scene delegate -> scene willConnectTo")
        if let windowScene = scene as? UIWindowScene {
            setupAlertViewWindow(in: windowScene)
            setupProgressLoaderWindow(in: windowScene)
        }
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

extension SceneDelegate {
    private func setupAlertViewWindow(in scene: UIWindowScene) {
        let alertViewWindow = PassThroughWindow(windowScene: scene)
        // uncommet below statement if Alert View in show with Bottom Layer
        // progressLoaderWindow.windowLevel = UIWindow.Level.alert
        let alertViewController = HostingController(
            rootView: AlertView()
        )
        alertViewController.view.backgroundColor = .clear
        alertViewWindow.rootViewController = alertViewController
        alertViewWindow.isHidden = false
        self.alertViewWindow = alertViewWindow
    }
    
    private func setupProgressLoaderWindow(in scene: UIWindowScene) {
        let progressLoaderWindow = PassThroughWindow(windowScene: scene)
        // uncommet below statement if ProgressLoader View in show with Bottom Layer
        // progressLoaderWindow.windowLevel = UIWindow.Level.alert
        let progressLoaderViewController = HostingController(
            rootView: ProgressViewIndicator()
        )
        progressLoaderViewController.view.backgroundColor = .clear
        progressLoaderWindow.rootViewController = progressLoaderViewController
        progressLoaderWindow.isHidden = false
        self.progressLoaderWindow = progressLoaderWindow
    }
}

