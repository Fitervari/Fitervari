//
//  ContentView.swift
//  FitervariHealth WatchKit Extension
//
//  Created by Tobias Kern on 10.11.21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var connectivityProvider: ConnectivityProvider
    
    @State var running = false
    
    var body: some View {
        if(connectivityProvider.training != nil) {
            VStack {
                Text("Training: \(connectivityProvider.training ?? "")")
                
                if(!running) {
                    Button {
                        connectivityProvider.session.sendMessage(["startTraining" : true], replyHandler: nil)
                        running = true
                    } label: {
                        Text("Starten")
                    }
                } else {
                    Text("RUNNING")
                }
            }
        } else {
            Text("Wähle ein Training auf deinem iPhone aus.")
            // Reachable: \(String(connectivityProvider.session.isReachable))
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
