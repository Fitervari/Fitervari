//
//  ViewRouter.swift
//  Fitervari
//
//  Created by Tobias Kern on 13.12.21.
//

import Foundation

enum AppView {
    case signin, main
}

class ViewRouter: ObservableObject {
    @Published var currentView: AppView = .signin
}
