//
//  ShowViewOnTopLayerWithSwiftUIApp.swift
//  ShowViewOnTopLayerWithSwiftUI
//
//  Created by Gaurav Tak on 29/07/23.
//

import SwiftUI

@main
struct ShowViewOnTopLayerWithSwiftUIApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
