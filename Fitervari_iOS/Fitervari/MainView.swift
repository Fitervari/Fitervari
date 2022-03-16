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
			DashboardView()
				.tabItem {
					Image(systemName: "house")
				}
			
			AccountView()
				.tabItem {
					Image(systemName: "person")
				}
		}
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
