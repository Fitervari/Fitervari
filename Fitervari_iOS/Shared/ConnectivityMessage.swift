//
//  ConnectivityMessage.swift
//  Fitervari
//
//  Created by Tobias Kern on 14.12.21.
//

import Foundation

struct AuthTokenChangedMessage: Codable {
	var newToken: String?
}

struct SetWorkoutStateMessage: Codable {
	var state: Bool
}

struct SelectedTrainingMessage: Codable {
	var training: WorkoutPlan?
	
	// var id: Int64?
	// var name: String?
}

struct WorkoutDataMessage: Codable {
	var dateInterval: DateInterval
	// var workoutType: Int
	var segments: [WorkoutDataSegment]
}

enum WorkoutDataSegmentType: Codable {
	case pause
	
}

struct WorkoutDataSampleType: Codable {
	var type: String
	var samples: [WorkoutDataSample]
}

struct WorkoutDataSample: Codable {
	var dateOffset: Double
	// var value:
}

struct WorkoutDataSegment: Codable {
	var type: String
	var dateOffset: Double
	var healthData: [WorkoutDataSampleType]
}
