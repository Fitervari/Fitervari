//
//  Card.swift
//  Fitervari
//
//  Created by Tobias Kern on 23.09.21.
//

import SwiftUI

enum SubtitleLocation {
    case top
    case bottom
}

struct Card<Content, Background>: View where Content: View, Background: View {
	public var title: String?
    public var subtitle: String?
	public var action: (() -> Void)?
    public var subtitleLocation: SubtitleLocation
	
	public var content: () -> Content
	public var background: () -> Background
	public var roundedCorners: UIRectCorner
	
	init(title: String? = nil, subtitle: String? = nil, subtitleLocation: SubtitleLocation = .top, action: (() -> Void)? = nil, content: @escaping () -> Content, background: @escaping () -> Background, roundedCorners: UIRectCorner = .allCorners) {
		self.title = title
        self.subtitle = subtitle
		self.action = action
        self.subtitleLocation = subtitleLocation
		
		self.content = content
		self.background = background
		self.roundedCorners = roundedCorners
	}
	
    var body: some View {
		BasicCard(action: action, roundedCorners: roundedCorners) {
			VStack {
				if let title = title {
                    HStack {
                        Text(title)
                            .bold()
                            // .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("")
                            .bold()
                            .lineLimit(1)
                            .frame(alignment: .topLeading)
                    }
                    .font(.title2)
                    .foregroundColor(.white)
					
					if subtitleLocation == .bottom && subtitle != nil {
                        Spacer()
                    }
				}
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.body)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                if subtitleLocation == .top && subtitle != nil {
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
            Card(title: "Training XYZ", subtitle: "10 Übungen") {
				EmptyView()
			} background: {
				Color.blue
			}
			.frame(height: 170)
			.padding()
		}
    }
}
