//
//  DashboardView.swift
//  Fitervari
//
//  Created by Tobias Kern on 23.09.21.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
		ScrollView {
			if #available(iOS 15.0, *) {
                NavigationLink(destination: TrainingView()) {
                    Card(title: "Training 1", action: {
                        print("training 1")
                    }) {
                        Text("")
                    } background: {
                        Color.accentColor
                    }
                    .frame(height: 170)
                }
                
                NavigationLink(destination: TrainingView()) {
                    Card(title: "Training 2", action: {
                        print("training 2")
                    }) {
                        Text("")
                    } background: {
                        Color.accentColor
                    }
                    .frame(height: 170)
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
