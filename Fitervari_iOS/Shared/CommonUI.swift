//
//  CommonUI.swift
//  Fitervari
//
//  Created by Tobias Kern on 16.12.21.
//

import SwiftUI

fileprivate struct IconWidthKey: PreferenceKey {
	static var defaultValue: CGFloat? { nil }

	static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
		switch (value, nextValue()) {
		case (nil, let next): value = next
		case (_, nil): break
		case (.some(let current), .some(let next)): value = max(current, next)
		}
	}
}

extension IconWidthKey: EnvironmentKey { }

extension EnvironmentValues {
	fileprivate var iconWidth: CGFloat? {
		get { self[IconWidthKey.self] }
		set { self[IconWidthKey.self] = newValue }
	}
}

fileprivate struct IconWidthModifier: ViewModifier {
	@Environment(\.iconWidth) var width

	func body(content: Content) -> some View {
		content
			.background(GeometryReader { proxy in
				Color.clear
					.preference(key: IconWidthKey.self, value: proxy.size.width)
			})
			.frame(width: width)
	}
}

struct EqualIconWidthLabelStyle: LabelStyle {
	func makeBody(configuration: Configuration) -> some View {
		HStack {
			configuration.icon.modifier(IconWidthModifier())
			configuration.title
		}
	}
}

struct EqualIconWidthDomain<Content: View>: View {
	let content: Content
	@State var iconWidth: CGFloat? = nil

	init(@ViewBuilder _ content: () -> Content) {
		self.content = content()
	}

	var body: some View {
		content
			.environment(\.iconWidth, iconWidth)
			.onPreferenceChange(IconWidthKey.self) { self.iconWidth = $0 }
			.labelStyle(EqualIconWidthLabelStyle())
	}
}

public func margin(for width: Double) -> Double {
  guard !width.isZero else { return 0 }
  return width >= 414 ? 20 : 16
}

struct SingleAxisGeometryReader<Content: View>: View
{
	private struct SizeKey: PreferenceKey
	{
		static var defaultValue: CGFloat { 10 }
		static func reduce(value: inout CGFloat, nextValue: () -> CGFloat)
		{
			value = max(value, nextValue())
		}
	}

	@State private var size: CGFloat = SizeKey.defaultValue

	var axis: Axis = .horizontal
	var alignment: Alignment = .center
	let content: (CGFloat)->Content

	var body: some View
	{
		content(size)
			.frame(maxWidth:  axis == .horizontal ? .infinity : nil,
				   maxHeight: axis == .vertical   ? .infinity : nil,
				   alignment: alignment)
			.background(GeometryReader
			{
				proxy in
				Color.clear.preference(key: SizeKey.self, value: axis == .horizontal ? proxy.size.width : proxy.size.height)
			})
			.onPreferenceChange(SizeKey.self) { size = $0 }
	}
}

extension View {
	func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
		clipShape( RoundedCorner(radius: radius, corners: corners) )
	}
}

struct RoundedCorner: Shape {

	var radius: CGFloat = .infinity
	var corners: UIRectCorner = .allCorners

	func path(in rect: CGRect) -> Path {
		let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		return Path(path.cgPath)
	}
}
