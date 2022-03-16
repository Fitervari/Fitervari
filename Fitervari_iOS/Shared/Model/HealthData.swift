//
//  HealthData.swift
//  Fitervari
//
//  Created by Tobias Kern on 02.02.22.
//

import Foundation

struct HealthData: Codable {
	var type: String
	var value: Int64
	var time: Date
	var training: Int64
	// var training: Int64
	// var exerciseSet: Int64
}
