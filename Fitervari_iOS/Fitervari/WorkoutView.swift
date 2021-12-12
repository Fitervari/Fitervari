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
    
    @Binding var rootNavigate: Bool
    
    @State private var secondsElapsed = 0
    @State private var navigate = false
    
    @State private var set = 1
    @State private var title = "15x Crunches Arme seitlich"
    
    @State private var continueButtonLabel = "Weiter"
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            // Spacer()
            
            if #available(iOS 15.0, *) {
                StackedCard(title: title, stackedTitle: "2 Sets") {
                    EmptyView()
                } background: {
                    Color.orange
                }
                .frame(height: 170)
                
                /*
                StackedCard(title: title, stackedTitle: "Set \(set)/2") {
                    EmptyView()
                } background: {
                    Color.orange
                }
                .frame(height: 170)
                */
                
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
                        .frame(height: 70)
                        .frame(maxWidth: .infinity)
                }
                .tint(.yellow)
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                
                Button {
                    if(title == "20x Käfer-Übung") {
                        // set = 1;
                        title = "15s Frontstütz mit angehobenem Bein"
                        continueButtonLabel = "Beenden"
                    } else if(title == "15s Frontstütz mit angehobenem Bein") {
                        navigate = true;
                    } else {
                        // set = 1;
                        title = "20x Käfer-Übung"
                    }
                    
                    /*
                    if(set < 2) {
                        set += 1;
                        
                        if(title == "20x Käfer-Übung") {
                            continueButtonLabel = "Beenden"
                        }
                        
                    } else {
                        if(title == "20x Käfer-Übung") {
                            set = 1;
                            title = "15s Frontstütz mit angehobenem Bein"
                        } else if(title == "15s Frontstütz mit angehobenem Bein") {
                            navigate = true;
                        } else {
                            set = 1;
                            title = "20x Käfer-Übung"
                        }
                    }
                    */
                } label: {
                    Text(continueButtonLabel)
                        .bold()
                        .frame(height: 90)
                        .frame(maxWidth: .infinity)
                }
                .tint(.green)
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                
                NavigationLink(destination: FinishedWorkoutView(rootNavigate: $rootNavigate), isActive: $navigate) {
                    EmptyView()
                }
            }
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Bauch • \(String(format: "%02d", secondsElapsed % 3600 / 60)):\(String(format: "%02d", secondsElapsed % 60))")
        .onReceive(timer) { _ in
            secondsElapsed += 1
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    @State private static var navigate = true
    
    static var previews: some View {
        WorkoutView(rootNavigate: $navigate)
    }
}
