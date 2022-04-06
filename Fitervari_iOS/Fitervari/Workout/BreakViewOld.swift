//
//  BreakView.swift
//  Fitervari
//
//  Created by Tobias Kern on 05.03.22.
//

import SwiftUI

struct BreakView: View {
	var initialTime: Int?
	
	@State private var timeOffset = 0
	@State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	
	var body: some View {
		BasicCard {
			HStack {
				Text("PAUSE")
					.font(.title)
				
				Spacer()
					.frame(width: 20)
				
				Text(getDisplayTime(initialTime: initialTime, timeOffset: timeOffset))
					.font(.largeTitle)
					// .foregroundColor(paused ? .gray : .black) // missing dark mode support
					.onReceive(timer) { _ in
						timeOffset += 1
						
						if initialTime != nil && initialTime! - timeOffset == 0 {
							timer.upstream.connect().cancel()
						}
					}
			}
			.foregroundColor(.white)
			.animation(.easeInOut, value: timeOffset)
			
			/*
			Text(getDisplayTime(initialTime: initialTime, timeOffset: timeOffset))
				.font(.largeTitle)
				.foregroundColor(.white)
				.animation(.easeInOut, value: timeOffset)
				// .foregroundColor(paused ? .gray : .black) // missing dark mode support
				.onReceive(timer) { _ in
					timeOffset += 1
					
					if initialTime != nil && initialTime! - timeOffset == 0 {
						timer.upstream.connect().cancel()
					}
				}
			 */
		} backgroundColor: {
			Color.blue
		}

	}
	
	func getDisplayTime(initialTime: Int?, timeOffset: Int) -> String {
		let time = initialTime != nil
			? initialTime! - timeOffset
			: timeOffset
		
		return String(time)
	}
}

struct BreakViewOld: View {
	var initialTime: Int?
	
	// iOS 15 & above: @Environment(\.dismiss) private var dismiss
	@Environment(\.presentationMode) var presentationMode
	
	@State private var timeOffset = 0
	@State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	
	var body: some View {
		VStack {
			ZStack {
				Text(getDisplayTime(initialTime: initialTime, timeOffset: timeOffset))
					.font(.largeTitle)
					.animation(.easeInOut, value: timeOffset)
					// .foregroundColor(paused ? .gray : .black) // missing dark mode support
					.onReceive(timer) { _ in
						timeOffset += 1
					}
				
				VStack {
					Spacer()
					Text("Tippen um fortzufahren")
				}
				.font(.caption)
				.textCase(.uppercase)
				.foregroundColor(.gray)
			}
		}
		.navigationBarHidden(true)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.contentShape(Rectangle())
		.onTapGesture {
			timer.upstream.connect().cancel()
			timeOffset = 0
			
			presentationMode.wrappedValue.dismiss()
		}
	}
	
	func getDisplayTime(initialTime: Int?, timeOffset: Int) -> String {
		let time = initialTime != nil
			? initialTime! - timeOffset
			: timeOffset
		
		let displayTime = initialTime != nil
			? (time != 0 ? String(time) : "")
			: String(time)
		
		return displayTime
	}
}

struct BreakView_Previews: PreviewProvider {
    static var previews: some View {
        BreakView()
    }
}
