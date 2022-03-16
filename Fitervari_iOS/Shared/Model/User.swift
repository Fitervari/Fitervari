//
//  User.swift
//  Fitervari
//
//  Created by Tobias Kern on 28.02.22.
//

import Foundation

struct User: Codable {
	var id: Int64
	var firstname: String
	var lastname: String
	var trainer: Trainer
	var studio: Studio
	var creationDate: Date
}
