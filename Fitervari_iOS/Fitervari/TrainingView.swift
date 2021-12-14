//
//  TrainingView.swift
//  Fitervari
//
//  Created by Tobias Kern on 09.10.21.
//

import SwiftUI
import Communicator

fileprivate class ViewModel: ObservableObject {
	@Published var watchPaired: Bool
	@Published var watchReachable: Bool
	
	init() {
		let getPairingState = { (state: WatchState) -> Bool in
			if case .paired = state { return true } else { return false }
		}
		
		watchPaired = getPairingState(Communicator.shared.currentWatchState)
		watchReachable = Communicator.shared.currentReachability == .immediatelyReachable
		
		WatchState.observe(queue: DispatchQueue.main) { state in
			self.watchPaired = getPairingState(state)
		}
		
		Reachability.observe(queue: DispatchQueue.main) { reachability in
			self.watchReachable = reachability == .immediatelyReachable
		}
	}
}

struct TrainingView: View {
    @EnvironmentObject private var navigationModel: NavigationModel
	
	@ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                if #available(iOS 15.0, *) {
                    StackedCard(title: "15x Crunches Arme seitlich", stackedTitle: "2 Sets") {
                        EmptyView()
                    } background: {
                        Color.orange
                    }
                    .frame(height: 170)
                    
                    StackedCard(title: "20x Käfer-Übung", stackedTitle: "2 Sets") {
                        EmptyView()
                    } background: {
                        Color.orange
                    }
                    .frame(height: 170)
                    
                    StackedCard(title: "15s Frontstütz mit angehobenem Bein", stackedTitle: "2 Sets") {
                        EmptyView()
                    } background: {
                        Color.orange
                    }
                    .frame(height: 170)
                }
            }
            
			if viewModel.watchPaired {
				if viewModel.watchReachable {
					Text("Oder starte das Training auf deiner Apple Watch.")
				} else {
					Text("Apple Watch App nicht erreichbar.")
				}
			}
            
            if #available(iOS 15.0, *) {
                Button {
                    navigationModel.workoutView = true
                } label: {
                    Text("Starten")
                        .bold()
                        .frame(height: 90)
                        .frame(maxWidth: .infinity)
                }
                .tint(.green)
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                
                NavigationLink(destination: WorkoutView(), isActive: $navigationModel.workoutView) {
                    EmptyView()
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle("Bauch")
    }
}

struct TrainingView_Previews: PreviewProvider {
    @State private static var navigate = true
    
    static var previews: some View {
        TrainingView()
    }
}
