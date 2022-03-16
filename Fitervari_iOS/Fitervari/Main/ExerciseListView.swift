//
//  ExerciseListView.swift
//  Fitervari
//
//  Created by Tobias Kern on 05.03.22.
//

import SwiftUI

struct ExerciseListView: View {
    var body: some View {
		ScrollView {
			VStack {
				StackedCard(title: "Liegestütz", stackedTitle: "3 Sets") {
					VStack {
						HStack {
							Text("5x, 7x, 10x")
								.bold()
								.foregroundColor(.white)
						}
						.frame(maxWidth: .infinity, alignment: .leading)
						
						HStack(spacing: 0) {
							Text("Arme • ")
							Text("Matte")
						}
						.foregroundColor(.white)
						.frame(maxWidth: .infinity, alignment: .leading)
						
						Spacer()
					}
				} background: {
					Color.orange
				}
				.frame(height: 170)
				
				Card(title: "5x Liegestütz") {
					VStack {
						HStack(spacing: 0) {
							Text("Arme • ")
							Text("Matte")
						}
						.foregroundColor(.white)
						.frame(maxWidth: .infinity, alignment: .leading)
						
						Spacer()
					}
				} background: {
					Color.orange
				}
				.frame(height: 170)
			}
			.padding(.horizontal, margin(for: UIScreen.main.bounds.width))
		}
		.navigationTitle("Übungen Tag 1")
    }
}

struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView()
    }
}
