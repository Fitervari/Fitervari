//
//  ViewRouter.swift
//  Fitervari
//
//  Created by Tobias Kern on 13.12.21.
//

import Foundation

enum RootView {
    case signin
	case main
	case workout(plan: WorkoutPlanWithDate)
}

class RootNavigationModel: ObservableObject {
	@Published var currentView: RootView
	
	init(initialView: RootView) {
		currentView = initialView
	}
}
