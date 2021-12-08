//
//  HelloView.swift
//  HelloView
//
//  Created by Tobias Kern on 16.09.21.
//

import SwiftUI

struct HelloView: View {
	@State private var navigate = false
	
    var body: some View {
        VStack {
            VStack {
                Text("Fitervari")
                    .bold()
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Traumkörper leicht gemacht.")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.top, 40)
            
            Spacer()
            
            NavigationLink(destination: SignInView(), isActive: $navigate) {
                EmptyView()
            }
            
            if #available(iOS 15.0, *) {
                Button {
                    navigate = true;
                } label: {
                    Text("Anmelden")
                        .bold()
                        .frame(maxWidth: .infinity)
                }
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
            }
        }
        .padding(.horizontal)
        //.preferredColorScheme(.dark)
        /*
        .background(
            Image(uiImage: UIImage(named: "HelloImageLight")!)
                .resizable()
                .ignoresSafeArea()
        )
        */
        .navigationBarHidden(true)
    }
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        HelloView()
    }
}
