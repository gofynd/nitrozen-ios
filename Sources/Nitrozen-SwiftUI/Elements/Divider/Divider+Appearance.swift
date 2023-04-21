//
//  Divider+Appearance.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 17/04/23.
//

import Foundation

public extension NitrozenAppearance {
	
	class Divider {
		public enum Layout: Equatable {
			case horizontal(height: CGFloat)
			case verticle(width: CGFloat)
			case custom(size: CGSize)
		}
		var color: SystemColor
		
		var layout: Layout
		var shape: ViewShape
		
		public init(color: SystemColor, layout: Layout, shape: ViewShape) {
			self.color = color
			self.layout = layout
			self.shape = shape
		}
	}
}

public extension NitrozenAppearance.Divider {
	
	@discardableResult
	func color(_ color: SystemColor) -> Self { self.color = color; return self }
	
	@discardableResult
	func layout(_ layout: NitrozenAppearance.Divider.Layout) -> Self { self.layout = layout; return self }
	
	@discardableResult
	func shape(_ shape: ViewShape) -> Self { self.shape = shape; return self }
}

//MARK: Copy Support
public extension NitrozenAppearance.Divider {
	var copy: NitrozenAppearance.Divider {
		.init(color: self.color, layout: self.layout, shape: self.shape)
	}
}
