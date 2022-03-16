//
//  ExtensionDelegate.swift
//  FitervariHealth WatchKit Extension
//
//  Created by Tobias Kern on 19.01.22.
//

import Foundation
import WatchKit

class ExtensionDelegate: NSObject, WKExtensionDelegate {
	func handleActiveWorkoutRecovery() {
		HealthKitController.shared.recoverWorkout()
	}
}
