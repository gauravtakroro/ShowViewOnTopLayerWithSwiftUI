//
//  ContentView.swift
//  ShowViewOnTopLayerWithSwiftUI
//
//  Created by Gaurav Tak on 29/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Button {
                AlertView.show(alertTitle: "Test", alertMessage: " this is Okay.", primaryButton: .default(Text("Okay"), action: {
                    print("Okay Tapped")
                }))
            } label: {
              Text("Show Alert")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
