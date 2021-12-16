//
//  ConnectivityProvider.swift
//  Fitervari
//
//  Created by Tobias Kern on 13.12.21.
//

import Foundation
import Communicator
import Combine
import WatchConnectivity

class ConnectivityProvider: ObservableObject {
	static let shared = ConnectivityProvider()
	
	init() {
		ImmediateMessage.observe(queue: DispatchQueue.main) { message in
			debugPrint("incoming: \(message.identifier)")
			debugPrint(message.content)
			
			NotificationCenter.default.post(name: Notification.Name.init(rawValue: message.identifier), object: message.content)
		}
		
		GuaranteedMessage.observe(queue: DispatchQueue.main) { message in
			debugPrint("incoming (g): \(message.identifier)")
			debugPrint(message.content)
			
			NotificationCenter.default.post(name: Notification.Name.init(rawValue: message.identifier), object: message.content)
		}
	}
	
	func getProvider<T: Decodable>(for type: T.Type) -> AnyPublisher<T, Never> {
		debugPrint("getProv: WatchConnectivity.\(String(describing: type))")
		
		return NotificationCenter.default.publisher(for: Notification.Name.init(rawValue: "WatchConnectivity.\(String(describing: type))"), object: nil)
			.receive(on: DispatchQueue.main)
			.tryMap({ notification in
				return try JSONDecoder().decode(type, from: JSONSerialization.data(withJSONObject: notification.object as! Content))
			})
			.assertNoFailure()
			.eraseToAnyPublisher()
	}
	
	func sendMessage<T: Encodable>(data: T) {
		debugPrint("sendMsg: WatchConnectivity.\(String(describing: T.self))")
		
		Communicator.shared.send(ImmediateMessage(identifier: "WatchConnectivity.\(String(describing: T.self))", content: try! (JSONSerialization.jsonObject(with: try JSONEncoder().encode(data)) as? [String: Any])!)) { result in
			//
		}
	}
	
	func sendMessageWithFallback<T: Encodable>(data: T) {
		if Communicator.shared.currentReachability == .immediatelyReachable {
			sendMessage(data: data)
		} else {
			debugPrint("sendMsg (g): WatchConnectivity.\(String(describing: T.self))")
			
			Communicator.shared.send(GuaranteedMessage(identifier: "WatchConnectivity.\(String(describing: T.self))", content: try! (JSONSerialization.jsonObject(with: try JSONEncoder().encode(data)) as? [String: Any])!)) { result in
				//
			}
		}
	}
}
