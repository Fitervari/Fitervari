//
//  FitervariApp.swift
//  FitervariHealth WatchKit Extension
//
//  Created by Tobias Kern on 10.11.21.
//

import SwiftUI
import HealthKit

@main
struct FitervariApp: App {
	@StateObject private var healthKitController = HealthKitController()
	@ObservedObject private var authenticationHandler = AuthenticationHandler.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
				if authenticationHandler.authenticated {
					ContentView()
						.environmentObject(healthKitController)
				} else {
					HelloView()
				}
            }
        }
    }
}
