//
//  ConnectivityProvider.swift
//  Fitervari
//
//  Created by Tobias Kern on 13.12.21.
//

import Foundation
import Communicator
import Combine
import CoreMedia

class ConnectivityProvider: ObservableObject {
	static let shared = ConnectivityProvider()
	
	init() {
		ImmediateMessage.observe { msg in
			debugPrint("incoming: \(msg.identifier)")
			debugPrint(msg.content)
			
			NotificationCenter.default.post(name: Notification.Name.init(rawValue: msg.identifier), object: msg.content)
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
}
