//
//  Notification+Extension.swift
//  ShowViewOnTopLayerWithSwiftUI
//
//  Created by Gaurav Tak on 29/07/23.
//


import Foundation

enum NotificationData: String {
    case showLoader
    case rootViewType
    case showToast
    case dismissBottomSheet
    case showAlert
    case alertTitle
    case alertMessage
    case alertPrimaryButton
    case alertSecondButton
    case alertType
}

extension Notification.Name {
    static let updateRootViewNotification = Notification.Name("UpdateRootViewNotification")
    static let showProgressLoaderNotification = Notification.Name("ShowProgressLoaderNotification")
    static let showToastViewNotification = Notification.Name("ShowToastViewNotification")
    static let showAlertViewNotification = Notification.Name("ShowAlertViewNotification")
    static let dismissBottomSheetViewNotification = Notification.Name("dismissBottomSheetViewNotification")
}
