//
//  CustomDecoder.swift
//  Fitervari
//
//  Created by Tobias Kern on 02.02.22.
//

import Foundation

class CustomDecoder: JSONDecoder {
	let dateFormatter = DateFormatter()

	override init() {
		super.init()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
		// 2022-03-03T11:16:42
		dateFormatter.calendar = Calendar(identifier: .iso8601)
		dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
		dateFormatter.locale = Locale(identifier: "en_US_POSIX") // "de_DE")
		dateDecodingStrategy = .formatted(dateFormatter)
		// dateDecodingStrategy = .iso8601
		// dateFormatter.timeZone = .current
	}
}

class OtherCustomDecoder: JSONDecoder {
	let dateFormatter = DateFormatter()

	override init() {
		super.init()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		// 2022-03-03T11:16:42
		dateFormatter.calendar = Calendar(identifier: .iso8601)
		dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
		dateFormatter.locale = Locale(identifier: "en_US_POSIX") // "de_DE")
		dateDecodingStrategy = .formatted(dateFormatter)
		// dateDecodingStrategy = .iso8601
		// dateFormatter.timeZone = .current
	}
}
