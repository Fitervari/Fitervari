//
//  WorkoutView.swift
//  Fitervari
//
//  Created by Tobias Kern on 08.11.21.
//

import SwiftUI
import Alamofire

class WorkoutModel: ObservableObject {
	@Published var workoutPlan: WorkoutPlan
	
	init(workoutPlan: WorkoutPlan) {
		self.workoutPlan = workoutPlan
	}
}

struct WorkoutView: View {
	@EnvironmentObject private var navigationModel: RootNavigationModel
	@EnvironmentObject private var workoutModel: WorkoutModel
	
	@State private var idx = 0
	@State private var setIdx = 0
	
    @State private var secondsElapsed = 0
	
	@State private var paused = false
	@State private var navigate = false
	
	@State private var breakTime: Int? = nil
	
	var startDate = Date()
    
	@State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	
	// init()
	// UIApplication.shared.isIdleTimerDisabled = true
    
    var body: some View {
        VStack {
            // Spacer()
            
            if #available(iOS 15.0, *) {
				if(!paused) {
					if(workoutModel.workoutPlan.exercises[idx].exerciseSets.count >= 2) {
						StackedCard(title: "\(workoutModel.workoutPlan.exercises[idx].exerciseSets[setIdx].repetitions)x \(workoutModel.workoutPlan.exercises[idx].name)", stackedTitle: "Set \(setIdx + 1) von \(workoutModel.workoutPlan.exercises[idx].exerciseSets.count)") {
							VStack {
								HStack(spacing: 0) {
									Text("Arme • ")
									Text("Matte")
								}
								.foregroundColor(.white)
								.frame(maxWidth: .infinity, alignment: .leading)
								
								Spacer()
							}
						} background: {
							Color.orange
						}
						.frame(height: 170)
					} else {
						Card(title: "\(workoutModel.workoutPlan.exercises[idx].exerciseSets[safe: setIdx]?.repetitions ?? 1)x \(workoutModel.workoutPlan.exercises[idx].name)") {
							EmptyView()
						} background: {
							Color.orange
						}
						.frame(height: 170)
					}
				} else {
					BreakView(initialTime: breakTime)
						.frame(height: 170)
				}
                
                /*
                StackedCard(title: title, stackedTitle: "Set \(set)/2") {
                    EmptyView()
                } background: {
                    Color.orange
                }
                .frame(height: 170)
                */
                
                /*
                Card(title: "Übung 2", action: {
                }) {
                    Text("")
                } background: {
                    Color.accentColor
                }
                .frame(height: 170)
                
                StackedCard(title: "Übung 3", stackedTitle: "Set 1/2", stackedTitle2: "10 • 11 • 12") {
                    EmptyView()
                } background: {
                    Color.orange
                }
                .frame(height: 170)
                */
            }
            
            Spacer()
            
            if #available(iOS 15.0, *) {
				/*
                Button {
					UIApplication.shared.isIdleTimerDisabled = false
					timer.upstream.connect().cancel()
					
					withAnimation {
						navigationModel.currentView = .main
					}
					
                } label: {
                    Text("Abbrechen")
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                }
                .tint(.red)
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
				*/
                
				if !paused {
					Button {
						timer.upstream.connect().cancel()
						breakTime = nil
						paused.toggle()
					} label: {
						Text("Pausieren")
							.bold()
							.frame(height: 70)
							.frame(maxWidth: .infinity)
					}
					.tint(.yellow)
					.controlSize(.large)
					.buttonStyle(.borderedProminent)
				}
                
                Button {
					if !paused {
						if(setIdx == (workoutModel.workoutPlan.exercises[idx].exerciseSets.count - 1) || workoutModel.workoutPlan.exercises[idx].exerciseSets.count == 0) {
							if(idx == (workoutModel.workoutPlan.exercises.count - 1)) {
								let session = WorkoutSession(date: "", date2: "", startTime: "", endTime: "") // TODO: fix!
								// let session = WorkoutSession(date: Date(), startTime: startDate, endTime: Date())
								
								let req = AF.request("https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/workoutPlans/\(workoutModel.workoutPlan.id)/workoutSessions", method: .post, parameters: session, encoder: URLEncodedFormParameterEncoder(encoder: URLEncodedFormEncoder(dateEncoding: .iso8601), destination: .httpBody), headers: [ "Authorization": "Bearer \(AuthenticationHandler.shared.token!)" ])
								
								Task {
									try await req.serializingDecodable(WorkoutSession.self, decoder: CustomDecoder()).value
								}
								
								UIApplication.shared.isIdleTimerDisabled = false
								navigate = true
							} else {
								idx += 1
								setIdx = 0
								
								timer.upstream.connect().cancel()
								breakTime = 90
								paused.toggle()
							}
						} else {
							setIdx += 1
							
							timer.upstream.connect().cancel()
							breakTime = 90
							paused.toggle()
						}
					} else {
						timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
						paused.toggle()
					}
                } label: {
					Text(paused ? "Fortfahren" : "Weiter")
                        .bold()
                        .frame(height: 90)
                        .frame(maxWidth: .infinity)
                }
                .tint(.green)
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                
                NavigationLink(destination: FinishedWorkoutView(), isActive: $navigate) {
                    EmptyView()
                }
            }
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
		.navigationTitle("\(workoutModel.workoutPlan.name ?? "") • \(String(format: "%02d", secondsElapsed % 3600 / 60)):\(String(format: "%02d", secondsElapsed % 60))")
        .onReceive(timer) { _ in
            secondsElapsed += 1
        }
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			Button {
				UIApplication.shared.isIdleTimerDisabled = false
				timer.upstream.connect().cancel()
				
				withAnimation {
					navigationModel.currentView = .main
				}
			} label: {
				Image(systemName: "stop.circle.fill")
			}
			.foregroundColor(.red)
		}
    }
}

/*
struct WorkoutView_Previews: PreviewProvider {
    @State private static var navigate = true
    
    static var previews: some View {
        WorkoutView()
    }
}
*/
