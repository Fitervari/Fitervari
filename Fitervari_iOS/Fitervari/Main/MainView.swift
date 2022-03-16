//
//  MainView.swift
//  Fitervari
//
//  Created by Tobias Kern on 23.09.21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
		TabView {
			NavigationView {
				DashboardView()
					.navigationTitle("Training")
					.frame(maxWidth: .infinity)
					.navigationBarTitleDisplayMode(.inline)
					.padding(.horizontal, margin(for: UIScreen.main.bounds.width))
			}
			.tabItem {
				Image(systemName: "house")
			}
			.navigationViewStyle(.stack)
			
			NavigationView {
				HistoryView()
					.navigationTitle("Verlauf")
					.frame(maxWidth: .infinity)
					.navigationBarTitleDisplayMode(.inline)
			}
			.tabItem {
				Image(systemName: "clock") // TODO: check for alternative icons
			}
			.navigationViewStyle(.stack)
			
			/*
			NavigationView {
				AccountView()
					.navigationTitle("Benutzer")
					.frame(maxWidth: .infinity)
					.padding(.horizontal, margin(for: UIScreen.main.bounds.width))
			}
			.tabItem {
				Image(systemName: "person")
			}
			.navigationViewStyle(.stack)
			*/
			
			AccountView()
				.padding(.top, 30)
				.frame(maxWidth: .infinity, alignment: .topLeading)
				.padding(.horizontal, margin(for: UIScreen.main.bounds.width))
			.tabItem {
				Image(systemName: "person")
			}
		}
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
