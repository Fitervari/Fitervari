//
//  HealthData.swift
//  Fitervari
//
//  Created by Tobias Kern on 02.02.22.
//

import Foundation

struct HealthData: Codable {
	var type: Int64
	var value: Int64
	var time: String
	var training: Int64
	var exerciseSet: Int64
}

struct HealthDataProcessed: Codable {
	var type: String
	var value: Int64
	var time: Date
}
