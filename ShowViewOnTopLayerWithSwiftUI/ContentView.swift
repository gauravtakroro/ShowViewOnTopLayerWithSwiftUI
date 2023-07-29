//
//  ContentView.swift
//  ShowViewOnTopLayerWithSwiftUI
//
//  Created by Gaurav Tak on 29/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var showBottomSheet = false
    
    var body: some View {
        VStack {
            
            Button {
                AlertView.show(alertTitle: "Test", alertMessage: " This is shown with Normal  UI", primaryButton: .default(Text("Okay"), action: {
                    print("Okay Tapped")
                }))
            } label: {
              Text("Show Alert")
            }
            
            Button {
                showBottomSheet = true
            } label: {
              Text("Show Bottom Sheet")
            }.padding(.top, 16)
        }
        .padding()
        .sheet(isPresented: $showBottomSheet) {
           BottomSheetView()
                .padding(.top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
