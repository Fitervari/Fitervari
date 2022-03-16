//
//  HelloView.swift
//  FitervariHealth WatchKit Extension
//
//  Created by Tobias Kern on 16.12.21.
//

import SwiftUI

struct HelloView: View {
    var body: some View {
        Text("Scanne den QR Code mit deinem iPhone um dich anzumelden.")
			.scenePadding()
			.navigationTitle("Fitervari")
			.navigationBarTitleDisplayMode(.inline)
    }
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        HelloView()
    }
}
