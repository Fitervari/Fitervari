//
//  TrainingView.swift
//  Fitervari
//
//  Created by Tobias Kern on 09.10.21.
//

import SwiftUI

struct TrainingView: View {
    @EnvironmentObject private var navigationModel: NavigationModel
    @EnvironmentObject private var connectivityProvider: ConnectivityProvider
    
    var body: some View {
        VStack {
            ScrollView {
                if #available(iOS 15.0, *) {
                    StackedCard(title: "15x Crunches Arme seitlich", stackedTitle: "2 Sets") {
                        EmptyView()
                    } background: {
                        Color.orange
                    }
                    .frame(height: 170)
                    
                    StackedCard(title: "20x Käfer-Übung", stackedTitle: "2 Sets") {
                        EmptyView()
                    } background: {
                        Color.orange
                    }
                    .frame(height: 170)
                    
                    StackedCard(title: "15s Frontstütz mit angehobenem Bein", stackedTitle: "2 Sets") {
                        EmptyView()
                    } background: {
                        Color.orange
                    }
                    .frame(height: 170)
                }
            }
            
            if(connectivityProvider.session.isPaired) {
                if(connectivityProvider.session.isReachable) {
                    Text("Oder starte das Training auf deiner Apple Watch.")
                } else {
                    Text("Apple Watch App nicht erreichbar.")
                }
            }
            
            if #available(iOS 15.0, *) {
                Button {
                    navigationModel.workoutView = true
                } label: {
                    Text("Starten")
                        .bold()
                        .frame(height: 90)
                        .frame(maxWidth: .infinity)
                }
                .tint(.green)
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                
                NavigationLink(destination: WorkoutView(), isActive: $navigationModel.workoutView) {
                    EmptyView()
                }
                .isDetailLink(false)
                .onChange(of: connectivityProvider.start) { newValue in
                    navigationModel.workoutView = true
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle("Bauch")
    }
}

struct TrainingView_Previews: PreviewProvider {
    @State private static var navigate = true
    
    static var previews: some View {
        TrainingView()
    }
}
