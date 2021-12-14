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
	
	private var cancel = Set<AnyCancellable>()
	
	init() {
		ConnectivityProvider.shared.getProvider(for: SetWorkoutStateMessage.self)
			.map { msg in
				return msg.state
			}
			.assign(to: &$workoutView)
		
		cancel.insert($trainingView.sink { state in
			if !state {
				ConnectivityProvider.shared.sendMessage(data: SelectedTrainingMessage(name: nil))
			}
		})
	}
    
    func returnToDashboard() {
        trainingView = false
        workoutView = false
        finishedWorkoutView = false
    }
}
