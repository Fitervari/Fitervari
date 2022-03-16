//
//  BasicCard.swift
//  Fitervari
//
//  Created by Tobias Kern on 08.10.21.
//

import SwiftUI

struct BasicCard<Content, Background>: View where Content: View, Background: View {
	public var action: (() -> Void)?
	public var content: () -> Content
	public var background: () -> Background
	public var roundedCorners: UIRectCorner
	
	init(action: (() -> Void)? = nil, roundedCorners: UIRectCorner = .allCorners, content: @escaping () -> Content, background: @escaping () -> Background) {
		self.action = action
		self.content = content
		self.background = background
		self.roundedCorners = roundedCorners
	}
	
	var body: some View {
		ZStack {
			background()
			
			content()
				.padding(20)
		}
		.cornerRadius(20, corners: roundedCorners)
		// .onTapGesture(perform: action ?? {})
	}
}

extension BasicCard where Background == Color {
	init(action: (() -> Void)? = nil, content: @escaping () -> Content, backgroundColor: @escaping () -> Color) {
		self.init(action: action, content: content, background: backgroundColor)
	}
}

extension BasicCard where Background == EmptyView {
	init(action: (() -> Void)? = nil, content: @escaping () -> Content) {
		self.init(action: action, content: content, background: {
			return EmptyView()
		})
	}
}

struct BasicCard_Previews: PreviewProvider {
    static var previews: some View {
		if #available(iOS 15.0, *) {
			BasicCard(action: {
				print("hello world tapped")
			}) {
				EmptyView()
			} background: {
				Color.cyan
			}
			.frame(height: 170)
			.padding()
		}
    }
}
