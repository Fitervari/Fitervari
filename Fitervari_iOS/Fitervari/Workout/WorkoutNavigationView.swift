//
//  WorkoutView.swift
//  Fitervari
//
//  Created by Tobias Kern on 05.03.22.
//

import SwiftUI

struct WorkoutNavigationView: View {
    var body: some View {
		NavigationView {
			CountdownView()
		}
		.navigationViewStyle(.stack)
    }
}

/*
struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
*/
