//
//  ContentView.swift
//  FitervariHealth WatchKit Extension
//
//  Created by Tobias Kern on 10.11.21.
//

import SwiftUI
import Combine

fileprivate class ViewModel: ObservableObject {
	@Published var trainingName: String? = nil
	@Published var trainingState = false
	
	init() {
		ConnectivityProvider.shared.getProvider(for: SelectedTrainingMessage.self)
			.map(\.name)
			.assign(to: &$trainingName)
	}
}

struct ContentView: View {
	@ObservedObject private var viewModel = ViewModel()
	
	@State private var secondsElapsed = 0
	let timer = Timer.publish(every: 1, on: .main, in: .common)
	@State var cancel: Cancellable?
    
    var body: some View {
		if let trainingName = viewModel.trainingName {
			VStack {
				Text("Training: \(trainingName)")
				
				Button {
					if !viewModel.trainingState {
						cancel = timer.connect()
					} else {
						cancel?.cancel()
						cancel = nil
						secondsElapsed = 0
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
				
				if viewModel.trainingState {
					Text("\(String(format: "%02d", secondsElapsed % 3600 / 60)):\(String(format: "%02d", secondsElapsed % 60))")
						.onReceive(timer) { _ in
							secondsElapsed += 1
						}
				}
			}
		} else {
			Text("Wähle ein Training auf deinem iPhone aus.")
			// Reachable: \(String(connectivityProvider.session.isReachable))
				.padding()
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
