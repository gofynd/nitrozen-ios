//
//  View+ClipShapes.swift
//  
//
//  Created by Hitendra Solanki on 17/03/23.
//

import SwiftUI

extension View {
	
	func roundedCornerWithBorder(color: Color, radius: CGFloat = 10, lineWidth: CGFloat = 0.0) -> some View {
		self
			.overlay(content: {
				RoundedRectangle(cornerRadius: radius, style: .continuous)
					.stroke(color, lineWidth: lineWidth)
			})
			.clipShape(
				RoundedRectangle(cornerRadius: radius, style: .continuous)
			)
	}
	
	func capsuleWithBorder(color: Color, lineWidth: CGFloat = 0.0) -> some View {
		self
			.overlay(content: {
				Capsule(style: .continuous)
					.stroke(color, lineWidth: lineWidth)
			})
			.clipShape(
				Capsule(style: .continuous)
			)
	}
	
	func circleWithBorder(color: Color, lineWidth: CGFloat = 0.0) -> some View {
		self
			.overlay(content: {
				Circle()
					.stroke(color, lineWidth: lineWidth)
			})
			.clipShape(
				Circle()
			)
	}
}

extension View {
	func background<T: View>(
		alignment: Alignment = .center,
		@ViewBuilder content: () -> T
	) -> some View {
		background(Group(content: content), alignment: alignment)
	}

	func overlay<T: View>(
		alignment: Alignment = .center,
		@ViewBuilder content: () -> T
	) -> some View {
		overlay(Group(content: content), alignment: alignment)
	}
}
