//
//  FitervariApp.swift
//  FitervariHealth WatchKit Extension
//
//  Created by Tobias Kern on 10.11.21.
//

import SwiftUI

@main
struct FitervariApp: App {
    @StateObject var connectivityProvider = ConnectivityProvider()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(connectivityProvider)
            }
        }
    }
}
