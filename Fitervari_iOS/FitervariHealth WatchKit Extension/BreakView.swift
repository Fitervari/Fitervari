//
//  BreakView.swift
//  FitervariHealth WatchKit Extension
//
//  Created by Tobias Kern on 22.03.22.
//

import SwiftUI

struct BreakView: View {
	var initialTime: Int?
	
	@State private var timeOffset = 0
	@State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	
	var body: some View {
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
	}
	
	func getDisplayTime(initialTime: Int?, timeOffset: Int) -> String {
		let time = initialTime != nil
			? initialTime! - timeOffset
			: timeOffset
		
		return String(time)
	}
}

struct BreakView_Previews: PreviewProvider {
    static var previews: some View {
        BreakView()
    }
}
