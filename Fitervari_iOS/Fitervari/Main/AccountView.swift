//
//  AccountView.swift
//  Fitervari
//
//  Created by Tobias Kern on 23.09.21.
//

import SwiftUI

class AccountModel: ObservableObject {
	@Published var user: User
	
	init(user: User) {
		self.user = user
	}
}

struct AccountView: View {
	@EnvironmentObject private var navigationModel: RootNavigationModel
	@EnvironmentObject private var model: AccountModel
	@State private var cannotOpenUrl = false
	
    var body: some View {
		VStack(alignment: .leading) {
			Text("\(model.user.firstname) \(model.user.lastname)")
				.font(.title)
				.bold()
			
			HStack(spacing: 0) {
				Text("Mitglied seit ")
				Text(model.user.creationDate, style: .date)
				Text(", \(model.user.studio.name)") // TODO: look for alternatives to truncation
					.truncationMode(.tail)
			}
			.lineLimit(1)
			
			if #available(iOS 15.0, *) {
				HStack {
					Button {
						_ = AuthenticationHandler.shared.invalidate()
						navigationModel.currentView = .signin
					} label: {
						Text("Abmelden")
					}
					.tint(.red)
					.buttonStyle(.borderedProminent)
					
					Button {
						if let url = URL(string: "mailto:\(model.user.studio.emailAddress)") {
							if UIApplication.shared.canOpenURL(url) {
								UIApplication.shared.open(url)
							} else {
								cannotOpenUrl = true
							}
						}
					} label: {
						Text("Kontakt aufnehmen")
					}
					.tint(.blue)
					.buttonStyle(.borderedProminent)
					.alert(isPresented: $cannotOpenUrl) {
						Alert(
							title: Text("Fehler"),
							message: Text("Überprüfe ob du einen Email Client installiert hast")
						)
					}
				}
			}
			
			Spacer()
		}
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
