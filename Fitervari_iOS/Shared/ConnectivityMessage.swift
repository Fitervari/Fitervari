//
//  ConnectivityMessage.swift
//  Fitervari
//
//  Created by Tobias Kern on 14.12.21.
//

import Foundation

struct StartTrainingMessage: Codable {}

struct SelectedTrainingMessage: Codable {
	var name: String
}
