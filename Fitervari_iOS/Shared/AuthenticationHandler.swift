//
//  AuthenticationHandler.swift
//  Fitervari
//
//  Created by Tobias Kern on 16.12.21.
//

import Combine
import Foundation

class AuthenticationHandler: ObservableObject {
	static let shared = AuthenticationHandler()
	
	private var observerCancellable: AnyCancellable?
	
	private var tokenKey = "authToken"
	var token: String? {
		get {
			KeychainHandler.shared.get(key: tokenKey)
		}
	}
	
	@Published var authenticated: Bool
	
	private init() {
		authenticated = KeychainHandler.shared.get(key: tokenKey) != nil
		
		observerCancellable = ConnectivityProvider.shared.getProvider(for: AuthTokenChangedMessage.self)
			.sink { message in
				if case .success = KeychainHandler.shared.set(key: self.tokenKey, value: message.newToken) {
					self.authenticated = (message.newToken != nil)
				}
			}
	}
	
	func verifyAndSave(token: String) -> VoidResult<AuthenticationError> {
		guard AuthenticationHandler.verify(token: token) else {
			return .failure(AuthenticationError.invalidToken)
		}
		
		if case let .failure(error) = save(token: token) {
			return .failure(AuthenticationError.couldNotSave(detail: error))
		}
		
		return .success
	}
	
	// TODO: not yet implemented, requires API call to backend
	static func verify(token: String?) -> Bool {
		guard token != nil else {
			return false
		}
		
		return true
	}
	
	private func save(token: String?) -> VoidResult<Error> {
		let result = KeychainHandler.shared.set(key: tokenKey, value: token)
		
		if case let .failure(error) = result {
			return .failure(error)
		}
		
		ConnectivityProvider.shared.sendMessageWithFallback(data: AuthTokenChangedMessage(newToken: token))
		authenticated = (token != nil)
		return .success
	}
	
	func invalidate() -> VoidResult<Error> {
		return save(token: nil)
	}
}

enum AuthenticationError: Error {
	case invalidToken
	case couldNotSave(detail: Error)
}
