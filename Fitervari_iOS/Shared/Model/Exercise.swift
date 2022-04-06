//
//  Exercise.swift
//  Fitervari
//
//  Created by Tobias Kern on 02.02.22.
//

import Foundation

struct Exercise: Codable {
	var id: Int64
	var name: String
	var description: String?
	var deviceGroup: DeviceGroup
	var exerciseSets: [ExerciseSet]
}
