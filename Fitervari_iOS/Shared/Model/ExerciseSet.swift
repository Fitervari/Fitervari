//
//  ExerciseSet.swift
//  Fitervari
//
//  Created by Tobias Kern on 02.02.22.
//

import Foundation

struct ExerciseSet: Codable {
	var id: Int64
	var description: String?
	var repetitions: Int
}
