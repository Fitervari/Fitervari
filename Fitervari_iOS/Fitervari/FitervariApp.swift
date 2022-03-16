//
//  FitervariApp.swift
//  Fitervari
//
//  Created by Tobias Kern on 16.09.21.
//

import SwiftUI
import WatchConnectivity

@main
struct FitervariApp: App {
	@ObservedObject private var authenticationHandler = AuthenticationHandler.shared
	@ObservedObject private var navigationModel = RootNavigationModel(initialView: AuthenticationHandler.shared.authenticated ? .main : .signin)
	
	@StateObject private var accountModel = AccountModel(user: User(id: 0, firstname: "Tobias", lastname: "Kern", trainer: Trainer(id: 1, firstname: "Harald", lastname: "Keck", studio: Studio(id: 2, name: "Studio Limesstraße", address: "Limesstraße 12, 4060 Leonding", emailAddress: "kern.tobias@protonmail.com")), studio: Studio(id: 2, name: "Studio Limesstraße", address: "Limesstraße 12, 4060 Leonding", emailAddress: "kern.tobias@protonmail.com"), creationDate: Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 2))!))
    
    var body: some Scene {
        WindowGroup {
			ZStack {
				switch(navigationModel.currentView) {
					case .signin:
						NavigationView {
							HelloView()
						}
						.zIndex(1)
						.environmentObject(accountModel)
						.environmentObject(navigationModel)
					case .main:
						MainView()
							.zIndex(2)
							.environmentObject(accountModel)
							.environmentObject(navigationModel)
					case let .workout(plan):
						WorkoutNavigationView()
							.zIndex(3)
							.environmentObject(accountModel)
							.environmentObject(navigationModel)
							.environmentObject(WorkoutModel(workoutPlan: plan))
				}
			}
			.transition(.opacity)
		}
    }
}
