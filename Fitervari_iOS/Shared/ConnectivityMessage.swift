//
//  ConnectivityMessage.swift
//  Fitervari
//
//  Created by Tobias Kern on 14.12.21.
//

import Foundation

struct SetWorkoutStateMessage: Codable {
	var state: Bool
}

struct SelectedTrainingMessage: Codable {
	var name: String?
}
