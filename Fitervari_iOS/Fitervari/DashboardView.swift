//
//  DashboardView.swift
//  Fitervari
//
//  Created by Tobias Kern on 23.09.21.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject private var navigationModel: NavigationModel
    @EnvironmentObject private var connectivityProvider: ConnectivityProvider
    
    var body: some View {
		ScrollView {
			if #available(iOS 15.0, *) {
                Card(title: "Bauch", subtitle: "Woche 1, Tag 1-3") {
                    EmptyView()
                } background: {
                    Color.accentColor
                }
                .frame(height: 170)
                .onTapGesture {
                    if connectivityProvider.session.isReachable {
                        connectivityProvider.session.sendMessage(["training" : "Bauch"], replyHandler: nil)
                    }
                    
                    navigationModel.trainingView = true
                }
                
                NavigationLink(destination: TrainingView(), isActive: $navigationModel.trainingView) {
                    EmptyView()
                }
                .isDetailLink(false)
                
                /*
                NavigationLink(destination: TrainingView()) {
                    Card(title: "Oberschenkel", action: {
                        print("training 2")
                    }) {
                        Text("")
                    } background: {
                        Color.accentColor
                    }
                    .frame(height: 170)
                }
                */
			}
		}
        .padding(.horizontal)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .accentColor(.orange)
    }
}
