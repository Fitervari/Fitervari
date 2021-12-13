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
    @StateObject private var viewRouter = ViewRouter()
    @StateObject private var navigationModel = NavigationModel()
    @StateObject private var connectivityProvider = ConnectivityProvider()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                switch viewRouter.currentView {
                    case .signin:
                        HelloView()
                    case .main:
                        MainView()
                }
            }
            .environmentObject(viewRouter)
            .environmentObject(navigationModel)
            .environmentObject(connectivityProvider)
        }
    }
}
