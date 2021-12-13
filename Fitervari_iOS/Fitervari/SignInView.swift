//
//  SignInView.swift
//  SignInView
//
//  Created by Tobias Kern on 16.09.21.
//

import SwiftUI
import CodeScanner

struct SignInView: View {
    @EnvironmentObject private var viewRouter: ViewRouter
	
	var body: some View {
		GeometryReader { geometrics in
			ZStack(alignment: .top) {
				VStack {
					CodeScannerView(codeTypes: [.qr], scanMode: .continuous, simulatedData: "http://en.m.wikipedia.org") { result in
						result.map({ success in
							if(success == "http://en.m.wikipedia.org") {
                                viewRouter.currentView = .main
							}
						})
					}
				}
				
				if #available(iOS 15.0, *) {
					Rectangle()
						.frame(height: geometrics.safeAreaInsets.top)
						.background(.thinMaterial)
				}
			}
			.ignoresSafeArea()
		}
		.navigationBarHidden(true)
		.navigationBarBackButtonHidden(true)
    }
	
	/*
	private func getStatusBarHeight() -> CGFloat {
		let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
		let height = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
		return height
	}
	*/
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
