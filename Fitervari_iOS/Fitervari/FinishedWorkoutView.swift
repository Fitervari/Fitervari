//
//  FinishedWorkoutView.swift
//  Fitervari
//
//  Created by Tobias Kern on 04.12.21.
//

import SwiftUI

struct FinishedWorkoutView: View {
    @Binding var rootNavigate: Bool
    
    var body: some View {
        VStack {
            Text("Gut gemacht!")
                .font(.largeTitle)
            
            if #available(iOS 15.0, *) {
                Button {
                    rootNavigate = false
                } label: {
                    Text("Zum Homebildschirm")
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                }
                .tint(.accentColor)
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

struct FinishedWorkoutView_Previews: PreviewProvider {
    @State private static var navigate = true
    
    static var previews: some View {
        FinishedWorkoutView(rootNavigate: $navigate)
    }
}
