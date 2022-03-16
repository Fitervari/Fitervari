//
//  CountdownView.swift
//  Fitervari
//
//  Created by Tobias Kern on 04.03.22.
//

import SwiftUI

struct CountdownView: View {
	@State private var paused = false
	@State private var navigate = false
	@State private var timeRemaining = 10
	@State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	
    var body: some View {
		VStack {
			ZStack {
				if !paused {
					Text((timeRemaining != 0 ? String(timeRemaining) : ""))
						.font(.largeTitle)
						.animation(.easeInOut, value: timeRemaining)
						// .foregroundColor(paused ? .gray : .black) // missing dark mode support
						.onReceive(timer) { _ in
							timeRemaining -= 1
							
							if timeRemaining == 0 {
								timer.upstream.connect().cancel()
								navigate = true
							}
						}
				} else {
					Image(systemName: "pause.fill")
						.font(.largeTitle)
				}
				
				VStack {
					Spacer()
					
					/*
					Text("PAUSE BY TAP")
					Text("SKIP BY LONG PRESS")
					*/
					
					Text("Tippen zum pausieren")
					Text("Lange drücken zum überspringen")
				}
				.font(.caption)
				.textCase(.uppercase)
				.foregroundColor(.gray)
			}
			
			NavigationLink(destination: WorkoutView(), isActive: $navigate) {
				EmptyView()
			}
		}
		.navigationBarHidden(true)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.contentShape(Rectangle())
		.onTapGesture {
			if !paused {
				timer.upstream.connect().cancel()
			} else {
				timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
			}
			
			paused.toggle()
		}
		.onLongPressGesture {
			timer.upstream.connect().cancel()
			timeRemaining = 0
			navigate = true
		}
    }
}

/*
struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}
*/
