//
//  FitervariApp.swift
//  FitervariHealth WatchKit Extension
//
//  Created by Tobias Kern on 10.11.21.
//

import SwiftUI
import HealthKit
import WatchKit

@main
struct FitervariApp: App {
	@WKExtensionDelegateAdaptor(ExtensionDelegate.self) var delegate
	
	@StateObject private var healthKitController = HealthKitController.shared
	@ObservedObject private var authenticationHandler = AuthenticationHandler.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
				if authenticationHandler.authenticated {
					ContentView()
				} else {
					HelloView()
				}
            }
			.environmentObject(healthKitController)
        }
    }
}
