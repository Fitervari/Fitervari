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
	
	init(action: (() -> Void)? = nil, content: @escaping () -> Content, background: @escaping () -> Background) {
		self.action = action
		self.content = content
		self.background = background
	}
	
	var body: some View {
		ZStack {
			background()
			
			content()
				.padding(20)
		}
		.clipShape(RoundedRectangle(cornerRadius: 20))
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
