//
//  ConnectivityProvider.swift
//  FitervariHealth WatchKit Extension
//
//  Created by Tobias Kern on 12.12.21.
//

import WatchConnectivity
import SwiftUI

class ConnectivityProvider: NSObject, ObservableObject {
    var session = WCSession.default
    @Published var training: String?

    override init() {
        super.init()
        session.delegate = self
        session.activate()
    }
}

extension ConnectivityProvider: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        debugPrint("WCSession activationDidCompleteWith activationState:\(activationState) error:\(String(describing: error))")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        debugPrint("message received!")
        debugPrint(message)
        
        DispatchQueue.main.async {
            self.training = message["training"] as! String?
        }
    }
}
