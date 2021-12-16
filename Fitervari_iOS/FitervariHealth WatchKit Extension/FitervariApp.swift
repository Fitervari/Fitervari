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
	@StateObject var healthKitController = HealthKitController()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
					.environmentObject(healthKitController)
            }
        }
    }
}
