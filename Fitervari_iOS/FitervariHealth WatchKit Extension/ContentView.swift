//
//  ContentView.swift
//  FitervariHealth WatchKit Extension
//
//  Created by Tobias Kern on 10.11.21.
//

import SwiftUI
import Combine

fileprivate class ViewModel: ObservableObject {
	@Published var training: WorkoutPlanWithDate? = nil
	
	@Published var trainingState = false
	
	init() {
		ConnectivityProvider.shared.getProvider(for: SelectedTrainingMessage.self)
			.map(\.training)
			.assign(to: &$training)
	}
}

struct ContentView: View {
	@EnvironmentObject private var healthKitController: HealthKitController
	
	@ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
		ZStack {
			if let training = viewModel.training {
				VStack {
					Text("Training: \(training.name!)")
					
					Button {
						if !viewModel.trainingState {
							Task {
								await healthKitController.startWorkout(planId: training.id)
							}
						} else {
							healthKitController.stopWorkout()
						}
						
						viewModel.trainingState.toggle()
						ConnectivityProvider.shared.sendMessage(data: SetWorkoutStateMessage(state: viewModel.trainingState))
						
					} label: {
						if !viewModel.trainingState {
							Text("Starten")
						} else {
							Text("Abbrechen")
						}
					}
				}
			} else {
				Text("Wähle ein Training auf deinem iPhone aus.")
					.scenePadding()
			}
			
			NavigationLink(destination: WorkoutView(training: self.viewModel.training), isActive: $viewModel.trainingState) {
				EmptyView()
			}
			.opacity(0)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
