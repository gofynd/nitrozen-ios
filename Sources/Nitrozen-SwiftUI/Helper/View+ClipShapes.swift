//
//  View+ClipShapes.swift
//  
//
//  Created by Hitendra Solanki on 17/03/23.
//

import SwiftUI

public extension NitrozenViewBox {
	
	func roundedCornerWithBorder(color: Color, radius: CGFloat = 10, lineWidth: CGFloat = 0.0) -> some View {
		self.value.nitrozen
			.overlay(content: {
				RoundedRectangle(cornerRadius: radius, style: .circular)
					.strokeBorder(color, lineWidth: lineWidth)
			})
			.clipShape(
				RoundedRectangle(cornerRadius: radius, style: .circular)
			)
	}
	
	func capsuleWithBorder(color: Color, lineWidth: CGFloat = 0.0) -> some View {
		self.value.nitrozen
			.overlay(content: {
				Capsule(style: .circular)
					.strokeBorder(color, lineWidth: lineWidth)
			})
			.clipShape(
                Capsule(style: .circular)
			)
	}
	
	func circleWithBorder(color: Color, lineWidth: CGFloat = 0.0) -> some View {
		self.value.nitrozen
			.overlay(content: {
				Circle()
					.strokeBorder(color, lineWidth: lineWidth)
			})
			.clipShape(
				Circle()
			)
	}
}

public extension NitrozenViewBox {
	func background<T: View>(
		alignment: Alignment = .center,
		@ViewBuilder content: () -> T
	) -> some View {
		self.value.background(Group(content: content), alignment: alignment)
	}

	func overlay<T: View>(
		alignment: Alignment = .center,
		@ViewBuilder content: () -> T
	) -> some View {
		self.value.overlay(Group(content: content), alignment: alignment)
	}
}
