//
//  StackedCard.swift
//  Fitervari
//
//  Created by Tobias Kern on 08.11.21.
//

import SwiftUI
import DynamicColor

struct StackedCard<Content>: View where Content: View {
    public var title: String?
    public var stackedTitle: String?
    public var stackedTitle2: String?
    
    public var action: (() -> Void)?
    public var content: () -> Content
    public var background: () -> Color
    
    init(title: String? = nil, stackedTitle: String? = nil, stackedTitle2: String? = nil, action: (() -> Void)? = nil, content: @escaping () -> Content, background: @escaping () -> Color) {
        self.title = title
        self.stackedTitle = stackedTitle
        self.stackedTitle2 = stackedTitle2
        
        self.action = action
        self.content = content
        self.background = background
    }
    
    var body: some View {
        if #available(iOS 15.0, *) {
            ZStack {
                ZStack {
                    Color(uiColor: DynamicColor(background()).lighter(amount: 0.12))
                    
                    HStack {
                        Text(stackedTitle ?? "")
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        
                        Text(stackedTitle2 ?? "")
                            .lineLimit(1)
                            .frame(maxHeight: .infinity, alignment: .topLeading)
                    }
                    .padding(.top, 11)
                    .padding(.horizontal, 20)
                    .font(.headline)
                    .foregroundColor(.white)
                }
                .clipShape(RoundedRectangle(cornerRadius: 20))
                // .onTapGesture(perform: action ?? {})
                
                /*
                Card(title: "", action: action, content: content, background: {
                    Color(uiColor: DynamicColor(background()).lighter(amount: 0.12))
                })
                */
                
                Card(title: title, action: action, content: content, background: background)
                    .offset(x: 0, y: 40)
                    .padding(.bottom, 40)
            }
        } else {
        }
    }
}

/*
struct StackedCard<Content, Background>: View where Content: View, Background: View {
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
        ZStack {
            Card(title: title, action: action, content: content, background: background)
            
            Card(title: "hello", action: action, content: content, background: background)
                .offset(x: 0, y: 10)
        }
    }
}
*/

struct StackedCard_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            StackedCard(title: "10x Liegestütz", stackedTitle: "Set 1/2", stackedTitle2: "A") {
                EmptyView()
            } background: {
                Color.orange
            }
            .frame(height: 140)
            .padding()
        }
    }
}
