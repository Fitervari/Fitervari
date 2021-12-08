//
//  Card.swift
//  Fitervari
//
//  Created by Tobias Kern on 23.09.21.
//

import SwiftUI

struct Card<Content, Background>: View where Content: View, Background: View {
	public var title: String?
	public var action: (() -> Void)?
	
	public var content: () -> Content
	public var background: () -> Background
	
	init(title: String? = nil, action: (() -> Void)? = nil, content: @escaping () -> Content, background: @escaping () -> Background) {
		self.title = title
		self.action = action
		
		self.content = content
		self.background = background
	}
	
    var body: some View {
		BasicCard(action: action) {
			VStack {
				if let title = title {
					Text(title)
						.bold()
						.font(.title2)
						.foregroundColor(.white)
						.frame(maxWidth: .infinity, alignment: .leading)
					
					Spacer()
				}
				
				content()
			}
		} background: {
			background()
		}
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
		if #available(iOS 15.0, *) {
			Card(title: "Training XYZ") {
				EmptyView()
			} background: {
				Color.blue
			}
			.frame(height: 170)
			.padding()
		}
    }
}
