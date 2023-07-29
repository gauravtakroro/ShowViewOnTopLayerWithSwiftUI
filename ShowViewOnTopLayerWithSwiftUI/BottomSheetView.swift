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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 28)
    }
}

