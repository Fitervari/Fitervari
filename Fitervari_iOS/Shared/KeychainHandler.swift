//
//  KeychainHandler.swift
//  Fitervari
//
//  Created by Tobias Kern on 16.12.21.
//

import Foundation
import KeychainAccess

class KeychainHandler {
	private init() {}
	static let shared = KeychainHandler()
	
	private let keychain = Keychain(service: "at.fitervari.fitervari")
		.label("Fitervari Keychain")
		.accessibility(.whenUnlocked)
		.synchronizable(true)
	
	func get(key: String) -> String? {
		return try? keychain.getString(key)
	}
	
	func set(key: String, value: String?) -> Result<Void, Error> {
		if let value = value {
			do {
				try keychain
					.label("Fitervari Authentication Token")
					.set(value, key: key)
			} catch {
				return .failure(error)
			}
		} else {
			do {
				try keychain.remove(key)
			} catch {
				return .failure(error)
			}
		}
		
		return .success
	}
}
