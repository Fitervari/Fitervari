//
//  ContentView.swift
//  FitervariHealth WatchKit Extension
//
//  Created by Tobias Kern on 10.11.21.
//

import SwiftUI
import Combine

fileprivate class ViewModel: ObservableObject {
	@Published var trainingId: Int64? = nil
	@Published var trainingName: String? = nil
	
	@Published var trainingState = false
	
	init() {
		ConnectivityProvider.shared.getProvider(for: SelectedTrainingMessage.self)
			.map(\.id)
			.assign(to: &$trainingId)
		
		ConnectivityProvider.shared.getProvider(for: SelectedTrainingMessage.self)
			.map(\.name)
			.assign(to: &$trainingName)
	}
}

struct ContentView: View {
	@EnvironmentObject private var healthKitController: HealthKitController
	
	@ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
		ZStack {
			if let trainingName = viewModel.trainingName {
				VStack {
					Text("Training: \(trainingName)")
					
					Button {
						if !viewModel.trainingState {
							Task {
								await healthKitController.startWorkout(planId: viewModel.trainingId!)
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
			
			NavigationLink(destination: WorkoutView(), isActive: $viewModel.trainingState) {
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
