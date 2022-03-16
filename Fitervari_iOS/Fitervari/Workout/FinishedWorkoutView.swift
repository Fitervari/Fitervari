//
//  FinishedWorkoutView.swift
//  Fitervari
//
//  Created by Tobias Kern on 04.12.21.
//

import SwiftUI
import ConfettiSwiftUI

struct FinishedWorkoutView: View {
	@EnvironmentObject private var navigationModel: RootNavigationModel
	
	@State private var triggerConfetti = 0
    
    var body: some View {
        VStack {
			if #available(iOS 15.0, *) {
				ZStack {
					ConfettiCannon(counter: $triggerConfetti, num: 200, confettis: [ .shape(.circle), .shape(.square), .shape(.triangle) ], colors: [ .blue, .red, .green, .yellow, .purple, .orange ], confettiSize: 13, rainHeight: 1200, fadesOut: true, opacity: 1, openingAngle: Angle(degrees: 30), closingAngle: Angle(degrees: 150), radius: 520, repetitions: 0, repetitionInterval: 1)
					
					Text("Gut gemacht!")
						.font(.largeTitle)
					
					VStack {
						Spacer()
						Text("Tippen zum beenden")
					}
					.font(.caption)
					.textCase(.uppercase)
					.foregroundColor(.gray)
				}
				.task {
					try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
					triggerConfetti = 1
				}
			}
            
			/*
            if #available(iOS 15.0, *) {
                Button {
					withAnimation {
						navigationModel.currentView = .main
					}
					
                } label: {
                    Text("Zum Homebildschirm")
                        //.frame(height: 50)
                        //.frame(maxWidth: .infinity)
                }
                .tint(.accentColor)
                //.controlSize(.large)
                .buttonStyle(.borderedProminent)
            }
			*/
        }
        .navigationBarBackButtonHidden(true)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.contentShape(Rectangle())
		.onTapGesture {
			withAnimation {
				navigationModel.currentView = .main
			}
		}
    }
}

struct FinishedWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        FinishedWorkoutView()
    }
}
