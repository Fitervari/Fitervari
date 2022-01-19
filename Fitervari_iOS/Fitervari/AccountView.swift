//
//  AccountView.swift
//  Fitervari
//
//  Created by Tobias Kern on 23.09.21.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
		VStack {
			Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
			Button {
				_ = AuthenticationHandler.shared.invalidate()
			} label: {
				Text("INVALIDATE")
			}
		}
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
