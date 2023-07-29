//
//  BottomSheetView.swift
//  ShowViewOnTopLayerWithSwiftUI
//
//  Created by Gaurav Tak on 29/07/23.
//

import SwiftUI

struct BottomSheetView: View {
     @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack (alignment: .center) {
            Button {
                AlertView.show(alertTitle: "Test", alertMessage: "This is shown with Bottom Sheet UI", primaryButton: .default(Text("Okay"), action: {
                    print("Okay Tapped")
                }))
            } label: {
              Text("Show Alert")
            }
            
            Button {
                ProgressViewIndicator.show()
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    // auto hiding after 5 seconds
                    ProgressViewIndicator.hide()
                }
            } label: {
              Text("Show Progress View")
            }.padding(.top, 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 28)
    }
}

