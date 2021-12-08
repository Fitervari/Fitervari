//
//  TrainingView.swift
//  Fitervari
//
//  Created by Tobias Kern on 09.10.21.
//

import SwiftUI

struct TrainingView: View {
    @State private var navigate = false
    
    var body: some View {
        VStack {
            ScrollView {
                if #available(iOS 15.0, *) {
                    Card(title: "Übung 1", action: {
                    }) {
                        Text("")
                    } background: {
                        Color.accentColor
                    }
                    .frame(height: 170)
                    
                    Card(title: "Übung 2", action: {
                    }) {
                        Text("")
                    } background: {
                        Color.accentColor
                    }
                    .frame(height: 170)
                    
                    StackedCard(title: "Übung 3", stackedTitle: "Set 1/2") {
                        EmptyView()
                    } background: {
                        Color.orange
                    }
                    .frame(height: 170)
                }
            }
            
            if #available(iOS 15.0, *) {
                Button {
                    navigate = true;
                } label: {
                    Text("Starten")
                        .bold()
                        .frame(height: 90)
                        .frame(maxWidth: .infinity)
                }
                .tint(.green)
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                
                NavigationLink(destination: WorkoutView(), isActive: $navigate) {
                    EmptyView()
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle("Training X")
    }
}

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView()
    }
}
