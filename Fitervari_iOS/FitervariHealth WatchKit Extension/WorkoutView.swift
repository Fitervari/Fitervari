//
//  WorkoutView.swift
//  FitervariHealth WatchKit Extension
//
//  Created by Tobias Kern on 16.12.21.
//

import SwiftUI
import Combine

struct WorkoutView: View {
	// iOS 15 & above: @Environment(\.dismiss) private var dismiss
	@Environment(\.presentationMode) var presentationMode
	
	@State var activeTab = 2
	
	@State var paused = false
	@State private var secondsElapsed = 0
	@State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	
	@EnvironmentObject private var healthKitController: HealthKitController
	@State private var hr = -1
	@State private var eb = 0.0
	
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
				
				Text("2 Sets")
				
				Text("15x Crunches Arme seitlich")
					.bold()
					.font(.title3)
				
				Spacer()
				
				Button {
					//
				} label: {
					Text("Weiter")
				}
				.tint(.green)
			}
			.tag(2)
			
			VStack {
				Button {
					//
				} label: {
					Text("Zurück")
				}
				.tint(.blue)
				
				Button {
					if !paused {
						timer.upstream.connect().cancel()
					} else {
						timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
					}
					
					paused.toggle()
				} label: {
					Text(!paused ? "Pause" : "Fortfahren")
				}
				.tint(.yellow)
				
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

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			WorkoutView()
		}
    }
}
