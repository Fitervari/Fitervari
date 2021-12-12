//
//  FitervariApp.swift
//  Fitervari
//
//  Created by Tobias Kern on 16.09.21.
//

import SwiftUI
import WatchConnectivity

@main
struct FitervariApp: App {
    @StateObject var connectivityProvider = ConnectivityProvider()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HelloView()
                // MainView()
            }
            .environmentObject(connectivityProvider)
        }
    }
}
