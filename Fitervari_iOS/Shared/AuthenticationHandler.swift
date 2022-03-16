//
//  AuthenticationHandler.swift
//  Fitervari
//
//  Created by Tobias Kern on 16.12.21.
//

import Combine
import Foundation
import Alamofire

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
	
	func verifyAndSave(token: String, navigationModel: RootNavigationModel) async -> VoidResult<AuthenticationError> {
		guard let authToken = await AuthenticationHandler.verify(token: token) else {
			return .failure(AuthenticationError.invalidToken)
		}
		
		if case let .failure(error) = save(token: authToken) {
			return .failure(AuthenticationError.couldNotSave(detail: error))
		}
		
		navigationModel.currentView = .main
		return .success
	}
	
	static func verify(token: String?) async -> String? {
		guard token != nil else {
			return nil
		}
		
		return token
		// let req = AF.request("https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/authToken?activationToken=\(token!)", method: .get)
		
		/*
		do {
			return try await req.validate(statusCode: [200]).serializingString().value
		} catch {
			return nil
		}*/
		
	}
	
	private func save(token: String?) -> VoidResult<Error> {
		let result = KeychainHandler.shared.set(key: tokenKey, value: token)
		
		if case let .failure(error) = result {
			return .failure(error)
		}
		
		ConnectivityProvider.shared.sendMessageWithFallback(data: AuthTokenChangedMessage(newToken: token))
		DispatchQueue.main.async {
			self.authenticated = (token != nil)
		}
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
