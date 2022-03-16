//
//  WorkoutPlan.swift
//  Fitervari
//
//  Created by Tobias Kern on 02.02.22.
//

import Foundation

struct WorkoutPlan: Codable {
	var id: Int64
	var validFrom: String
	// var validTill: Date?
	var name: String?
	// var notes: String?
	// var description: String?
	var archived: Bool
	var exercises: [Exercise]
}
