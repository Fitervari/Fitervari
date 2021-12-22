//
//  DashboardView.swift
//  Fitervari
//
//  Created by Tobias Kern on 23.09.21.
//

import SwiftUI
import Communicator

struct DashboardView: View {
    @EnvironmentObject private var navigationModel: NavigationModel
    
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
					ConnectivityProvider.shared.sendMessage(data: SelectedTrainingMessage(name: "Bauch"))
                    navigationModel.trainingView = true
                }
                
                NavigationLink(destination: TrainingView(), isActive: $navigationModel.trainingView) {
                    EmptyView()
                }
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
