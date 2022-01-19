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
	@ObservedObject private var authenticationHandler = AuthenticationHandler.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
				if authenticationHandler.authenticated {
					MainView()
				} else {
					HelloView()
				}
            }
			.navigationViewStyle(.stack)
            .environmentObject(viewRouter)
            .environmentObject(navigationModel)
        }
    }
}
