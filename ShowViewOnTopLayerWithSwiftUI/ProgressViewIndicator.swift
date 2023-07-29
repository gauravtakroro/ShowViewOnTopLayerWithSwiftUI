//
//  ProgressViewIndicator.swift
//  ShowViewOnTopLayerWithSwiftUI
//
//  Created by Gaurav Tak on 29/07/23.
//

import SwiftUI

struct ProgressViewIndicator: View {
    @State var shouldShowLoader = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.black)
                .edgesIgnoringSafeArea(.all).opacity(0.5)
            
            ProgressView().scaleEffect(5)
        }
        .onReceive(NotificationCenter.default.publisher(for: .showProgressLoaderNotification)) { data in
            guard let userInfo = data.userInfo, let shouldShowLoader = userInfo[NotificationData.showLoader] else {
                shouldShowLoader = false
                return
            }
            self.shouldShowLoader = shouldShowLoader as? Bool ?? false
        }
        .opacity(shouldShowLoader ? 1 : 0)
    }
   
    static func show() {
        updateActivityIndicatorVisibility(shouldShow: true)
    }
    
    static func hide() {
        updateActivityIndicatorVisibility(shouldShow: false)
    }
    
    private static func updateActivityIndicatorVisibility(shouldShow: Bool) {
        NotificationCenter.default.post(name: .showProgressLoaderNotification, object: nil, userInfo: [NotificationData.showLoader: shouldShow])
    }
}
