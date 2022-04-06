//
//  WorkoutSession.swift
//  Fitervari
//
//  Created by Tobias Kern on 13.02.22.
//

import Foundation

struct WorkoutSession: Codable {
	var id: Int64?
	// var validFrom: Date?
	// var validTill: Date?
	// var name: String?
	// var archived: Bool
	// var exercises: [Exercise]
	var date: String // fix
	var date2: String
	// var date: Date
	var startTime: String // fix
	var endTime: String? // fix
	// var startTime: Date
	// var endTime: Date?
	
	// var healthData: [HealthData]?
	
	var healthData: [HealthDataProcessed]?
}

struct WorkoutSessionDetailed: Codable {
	var id: Int64?
	// var date: String // fix
	// var date: Date
	var date: String
	var date2: Date
	var startTime: String // fix
	var endTime: String? // fix
	// var startTime: Date
	// var endTime: Date?
	
	var workoutPlan: WorkoutPlan
	var healthData: [HealthDataProcessed]
}
