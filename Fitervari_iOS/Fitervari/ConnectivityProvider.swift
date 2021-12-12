//
//  ConnectivityProvider.swift
//  Fitervari
//
//  Created by Tobias Kern on 12.12.21.
//

import WatchConnectivity
import SwiftUI

class ConnectivityProvider: NSObject, ObservableObject {
    var session = WCSession.default
    @Published var start = false

    override init() {
        super.init()
        session.delegate = self
        session.activate()
    }
}

extension ConnectivityProvider: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        debugPrint("WCSession activationDidCompleteWith activationState:\(activationState) error:\(String(describing: error))")
        debugPrint("WCSession.isPaired: \(session.isPaired), WCSession.isWatchAppInstalled: \(session.isWatchAppInstalled)")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        debugPrint("message received!")
        debugPrint(message)
        
        DispatchQueue.main.async {
            self.start = (message["startTraining"] as! Bool?) ?? false
        }
    }

    func sessionDidBecomeInactive(_ session: WCSession) {
        debugPrint("sessionDidBecomeInactive: \(session)")
    }

    func sessionDidDeactivate(_ session: WCSession) {
        debugPrint("sessionDidDeactivate: \(session)")
    }

    func sessionWatchStateDidChange(_ session: WCSession) {
        debugPrint("sessionWatchStateDidChange: \(session)")
    }
}
