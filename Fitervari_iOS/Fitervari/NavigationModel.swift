//
//  NavigationModel.swift
//  Fitervari
//
//  Created by Tobias Kern on 13.12.21.
//

import Foundation
import Combine

class NavigationModel: ObservableObject {
    @Published var trainingView = false
    @Published var workoutView = false
    @Published var finishedWorkoutView = false
	
	init() {
		ConnectivityProvider.shared.getProvider(for: StartTrainingMessage.self)
			.map { msg in
				return true
			}
			.assign(to: &$workoutView)
	}
    
    func returnToDashboard() {
        trainingView = false
        workoutView = false
        finishedWorkoutView = false
    }
}
