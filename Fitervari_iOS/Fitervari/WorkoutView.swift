//
//  WorkoutView.swift
//  Fitervari
//
//  Created by Tobias Kern on 08.11.21.
//

import SwiftUI

struct WorkoutView: View {
    // iOS 15 & above: @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    @State private var navigate = false
    
    var body: some View {
        VStack {
            // Spacer()
            
            if #available(iOS 15.0, *) {
                Card(title: "Übung 1", action: {
                }) {
                    Text("")
                } background: {
                    Color.accentColor
                }
                .frame(height: 170)
                
                /*
                Card(title: "Übung 2", action: {
                }) {
                    Text("")
                } background: {
                    Color.accentColor
                }
                .frame(height: 170)
                
                StackedCard(title: "Übung 3", stackedTitle: "Set 1/2", stackedTitle2: "10 • 11 • 12") {
                    EmptyView()
                } background: {
                    Color.orange
                }
                .frame(height: 170)
                */
            }
            
            Spacer()
            
            if #available(iOS 15.0, *) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Abbrechen")
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                }
                .tint(.red)
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                
                Button {
                    //
                } label: {
                    Text("Pausieren")
                        .bold()
                        .frame(height: 90)
                        .frame(maxWidth: .infinity)
                }
                .tint(.yellow)
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
            }
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Training X • 10:30")
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
