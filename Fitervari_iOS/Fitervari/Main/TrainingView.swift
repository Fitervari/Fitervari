//
//  TrainingView.swift
//  Fitervari
//
//  Created by Tobias Kern on 09.10.21.
//

import SwiftUI
import Communicator
import Alamofire

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
	@EnvironmentObject private var navigationModel: RootNavigationModel
	
	@ObservedObject private var viewModel = ViewModel()
	@Binding var training: WorkoutPlan?
	
	@State private var navigate = false
    
    var body: some View {
        ZStack {
            // ScrollView {
				VStack {
					Spacer()
						.frame(height: 5)
					
					
					/*
					Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec feugiat lacus nisl, ut ultrices ante laoreet sit amet. Morbi ultricies enim ut neque molestie egestas. Aliquam finibus condimentum venenatis. Nullam eu tortor metus. Morbi nec erat efficitur lectus imperdiet laoreet. Curabitur viverra ut justo vitae lacinia. Sed non turpis nec erat iaculis mollis.")
					 */
					
					Text("Keine Beschreibung vorhanden.")
						.foregroundColor(.gray)
					
					Spacer()
						.frame(height: 15)
					
					VStack(alignment: .leading, spacing: 5) {
						Text("Fortschritt:")
						
						Text("Muskelgruppen:")
						
						Text("Tage / Woche: ")
						
						Text("Gültig ab: ")
						
						Text("Gültig bis:") //
					}
					.frame(maxWidth: .infinity, alignment: .topLeading)
					
					Spacer()
					
					/*
					VStack(spacing: 3) {
						
						
						if #available(iOS 15.0, *) {
							Button {
								navigate = true
							} label: {
								HStack {
									Text("Übungen Tag 1")
									Spacer()
									Image(systemName: "arrow.forward")
										.font(Font.body.weight(.semibold))
								}
								.frame(maxWidth: .infinity)
							}
							.tint(.gray)
							.controlSize(.large)
							.buttonStyle(.borderedProminent)
						}
						
						if #available(iOS 15.0, *) {
							Button {
								navigate = true
							} label: {
								HStack {
									Text("Übungen Tag 2")
									Spacer()
									Image(systemName: "arrow.forward")
										.font(Font.body.weight(.semibold))
								}
								.frame(maxWidth: .infinity)
							}
							.tint(.gray)
							.controlSize(.large)
							.buttonStyle(.borderedProminent)
						}
						
						if #available(iOS 15.0, *) {
							Button {
								navigate = true
							} label: {
								HStack {
									Text("Übungen Tag 3")
									Spacer()
									Image(systemName: "arrow.forward")
										.font(Font.body.weight(.semibold))
								}
								.frame(maxWidth: .infinity)
							}
							.tint(.gray)
							.controlSize(.large)
							.buttonStyle(.borderedProminent)
						}
					}
					*/
					
					Spacer()
						.frame(height: 15)
					
					if #available(iOS 15.0, *) {
						Button {
							withAnimation {
								navigationModel.currentView = .workout(plan: training!) // TODO: avoid force unwrap
							}
							
						} label: {
							Text("Starten")
								.bold()
								.frame(height: 90)
								.frame(maxWidth: .infinity)
						}
						.tint(.green)
						.controlSize(.large)
						.buttonStyle(.borderedProminent)
					}
					
					Spacer()
						.frame(height: 15)
					
					NavigationLink(destination: ExerciseListView(), isActive: $navigate) {
						EmptyView()
					}
					
					/*
					if #available(iOS 15.0, *) {
						ForEach(training!.exercises, id: \.id) { exercise in
							if(exercise.exerciseSets.count >= 2) {
								StackedCard(title: "\(exercise.exerciseSets.compactMap { _set in "\(_set.repetitions)" }.joined(separator: ","))x \(exercise.name)", stackedTitle: "\(exercise.exerciseSets.count) Sets") {
									EmptyView()
								} background: {
									Color.orange
								}
								.frame(height: 170)
							} else {
								Card(title: "\(exercise.exerciseSets.first?.repetitions ?? 1)x \(exercise.name)") {
									EmptyView()
								} background: {
									Color.orange
								}
								.frame(height: 170)
							}
						}
					}*/
				}
				.padding(.horizontal, margin(for: UIScreen.main.bounds.width))
            }
            
			/*
			if viewModel.watchPaired {
				if viewModel.watchReachable {
					Text("Oder starte das Training auf deiner Apple Watch.")
				} else {
					Text("Apple Watch App nicht erreichbar.")
				}
			}
			*/
        //}
		.navigationTitle(training!.name!)
    }
}

/*
struct TrainingView_Previews: PreviewProvider {
    @State private static var navigate = true
    
    static var previews: some View {
        // TrainingView()
    }
}
*/
