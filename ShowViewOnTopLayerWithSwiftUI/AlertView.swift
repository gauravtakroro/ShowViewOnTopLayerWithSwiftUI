//
//  AlertView.swift
//  ShowViewOnTopLayerWithSwiftUI
//
//  Created by Gaurav Tak on 29/07/23.
//

import  SwiftUI

struct AlertView: View {
    @State var selectedShow: Bool = false
    @State var title = ""
    @State var message = ""
    @State var primaryButton: Alert.Button?
  
    var body: some View {
        ZStack {}.onReceive(NotificationCenter.default.publisher(for: .showAlertViewNotification)) { data in
            
            guard let userInfo = data.userInfo, let shouldShowAlert = userInfo[NotificationData.showAlert] else {
                selectedShow = false
                return
            }
            self.primaryButton = userInfo[NotificationData.alertPrimaryButton] as? Alert.Button
            self.message = userInfo[NotificationData.alertMessage] as? String ?? ""
            self.title = userInfo[NotificationData.alertTitle] as? String ?? ""
            
            self.selectedShow = shouldShowAlert as? Bool ?? false
        }
        .alert(isPresented: $selectedShow, content: { () -> Alert in
            Alert(title: Text(title), message: Text(message), dismissButton: primaryButton!)
        }).opacity(selectedShow ? 1 : 0)
    }
    
    static func show(alertTitle: String, alertMessage: String, primaryButton: Alert.Button) {
        updateAlertViewVisibility(alertMessage: alertMessage, alertTitle: alertTitle, primaryButton: primaryButton)
    }
   
    static func hide() {
        NotificationCenter.default.post(name: .showAlertViewNotification, object: nil, userInfo: nil)
    }
    
    private static func updateAlertViewVisibility(alertMessage: String, alertTitle: String, primaryButton: Alert.Button) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .showAlertViewNotification, object: nil, userInfo: [NotificationData.showAlert: true, NotificationData.alertMessage: alertMessage, NotificationData.alertTitle: alertTitle, NotificationData.alertPrimaryButton: primaryButton])
        }
    }
}

