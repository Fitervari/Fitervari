//
//  WorkoutView.swift
//  FitervariHealth WatchKit Extension
//
//  Created by Tobias Kern on 16.12.21.
//

import SwiftUI
import Combine

class WorkoutViewModel: ObservableObject {
	@Published var training: WorkoutPlan
	
	init(training: WorkoutPlan) {
		self.training = training
	}
}

struct WorkoutView: View {
	// iOS 15 & above: @Environment(\.dismiss) private var dismiss
	@Environment(\.presentationMode) var presentationMode
	
	@State var activeTab = 2
	
	@State var paused = false
	@State private var secondsElapsed = 0
	@State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	
	@State private var idx = 0
	@State private var setIdx = 0
	
	// @State private var navigate = false
	
	@State private var breakTime: Int? = nil
	
	var training: WorkoutPlan?
	// @Binding var trainingState: Bool
	
	@EnvironmentObject private var healthKitController: HealthKitController
	@State private var hr = -1
	@State private var eb = 0.0
	
	init(training: WorkoutPlan?) {
		self.training = training
		
		if let training = training {
			HealthKitController.shared.exerciseSet = training.exercises[idx].exerciseSets[setIdx].id
		}
	}
	
    var body: some View {
		TabView(selection: $activeTab) {
			EqualIconWidthDomain {
				VStack(alignment: .leading) {
					Label {
						Text("\(String(format: "%02d", secondsElapsed % 3600 / 60)):\(String(format: "%02d", secondsElapsed % 60))")
					} icon: {
						Image(systemName: "clock.fill")
							.foregroundColor(.cyan)
					}
					.font(.title2)
					
					Label {
						Text((hr != -1 ? String(hr) : "-") + " BPM")
					} icon: {
						Image(systemName: "heart.fill")
							.foregroundColor(.red)
					}
					.font(.title2)
					.onReceive(healthKitController.heartRate.assertNoFailure()) { value in
						hr = value
					}
					
					Label {
						Text(String(Int(eb)) + " kcal")
					} icon: {
						Image(systemName: "flame.fill")
							.foregroundColor(.orange)
					}
					.font(.title2)
					.onReceive(healthKitController.energyBurned.assertNoFailure()) { value in
						eb += value
					}
				}
			}
			.tag(1)
			
			VStack {
				Spacer()
				
				if(!paused) {
					if(training!.exercises[idx].exerciseSets.count >= 2) {
						Text("Set \(setIdx + 1) von \(training!.exercises[idx].exerciseSets.count)")
					}
					
					Text("\(training!.exercises[idx].exerciseSets[setIdx].repetitions)x \(training!.exercises[idx].name)")
						.bold()
						.font(.title3)
					
					// Text("Arme • ") Text("Matte")
					
				} else {
					BreakView(initialTime: breakTime)
				}
				
				Spacer()
				
				Button {
					if !paused {
						if(setIdx == (training!.exercises[idx].exerciseSets.count - 1) || training!.exercises[idx].exerciseSets.count == 0) {
							if(idx == (training!.exercises.count - 1)) {
								/*
								let session = WorkoutSession(date: "", startTime: "", endTime: "") // TODO: fix!
								// let session = WorkoutSession(date: Date(), startTime: startDate, endTime: Date())
								
								let req = AF.request("https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/workoutPlans/\(workoutModel.workoutPlan.id)/workoutSessions", method: .post, parameters: session, encoder: URLEncodedFormParameterEncoder(encoder: URLEncodedFormEncoder(dateEncoding: .iso8601), destination: .httpBody), headers: [ "Authorization": "Bearer \(AuthenticationHandler.shared.token!)" ])
								
								Task {
									try await req.serializingDecodable(WorkoutSession.self, decoder: CustomDecoder()).value
								}
								*/
								
								healthKitController.stopWorkout()
								presentationMode.wrappedValue.dismiss()
							} else {
								idx += 1
								setIdx = 0
								
								healthKitController.exerciseSet = training!.exercises[idx].exerciseSets[setIdx].id
								
								timer.upstream.connect().cancel()
								breakTime = 20
								paused.toggle()
							}
						} else {
							setIdx += 1
							
							healthKitController.exerciseSet = training!.exercises[idx].exerciseSets[setIdx].id
							
							timer.upstream.connect().cancel()
							breakTime = 20
							paused.toggle()
						}
					} else {
						timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
						paused.toggle()
					}
					
				} label: {
					Text(!paused ? "Weiter" : "Fortfahren")
				}
				.tint(.green)
			}
			.tag(2)
			
			VStack {
				/*
				Button {
					//
				} label: {
					Text("Zurück")
				}
				.tint(.blue)
				*/
				
				if(!paused) {
					Button {
						timer.upstream.connect().cancel()
						paused.toggle()
					} label: {
						Text("Pause")
					}
					.tint(.yellow)
				}
				
				Button {
					healthKitController.stopWorkout()
					presentationMode.wrappedValue.dismiss()
				} label: {
					Text("Abbrechen")
				}
				.tint(.red)
			}
			.tag(3)
		}
		.onReceive(timer) { _ in
			secondsElapsed += 1
		}
		.tabViewStyle(.page)
		.navigationTitle("Fitervari")
		.navigationBarBackButtonHidden(true)
		.navigationBarTitleDisplayMode(.inline)
    }
}

/*
struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			WorkoutView()
		}
    }
}
*/
