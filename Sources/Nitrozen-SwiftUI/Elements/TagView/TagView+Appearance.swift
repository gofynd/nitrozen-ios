//
//  TagView+Appearance.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 08/04/23.
//

import SwiftUI

public extension NitrozenAppearance {
	class TagView {
		public var selectedTitle: NitrozenAppearance.TextLabel
		public var deSelectedTitle: NitrozenAppearance.TextLabel
		
		var selectedBorderColor: SystemColor
		var deselectedBorderColor: SystemColor
		
		var selectedBorderWidth: CGFloat
		var deselectedBorderWidth: CGFloat
		
		var padding: ViewPadding
		var clearButtonColor: SystemColor
		
		init(selectedTitle: NitrozenAppearance.TextLabel, deSelectedTitle: NitrozenAppearance.TextLabel,
			 selectedBorderColor: SystemColor, deselectedBorderColor: SystemColor,
			 selectedBorderWidth: CGFloat, deselectedBorderWidth: CGFloat,
			 padding: ViewPadding, clearButtonColor: SystemColor
		) {
			self.selectedTitle = selectedTitle
			self.deSelectedTitle = deSelectedTitle
			self.selectedBorderColor = selectedBorderColor
			self.deselectedBorderColor = deselectedBorderColor
			self.selectedBorderWidth = selectedBorderWidth
			self.deselectedBorderWidth = deselectedBorderWidth
			self.padding = padding
			self.clearButtonColor = clearButtonColor
		}
	}
}


public extension NitrozenAppearance.TagView {
	@discardableResult
	func selectedTitle(_ selectedTitle: NitrozenAppearance.TextLabel) -> Self { self.selectedTitle = selectedTitle; return self }
	
	@discardableResult
	func deSelectedTitle(_ deSelectedTitle: NitrozenAppearance.TextLabel) -> Self { self.deSelectedTitle = deSelectedTitle; return self }
	
	@discardableResult
	func selectedBorderColor(_ selectedBorderColor: SystemColor) -> Self { self.selectedBorderColor = selectedBorderColor; return self }
	
	@discardableResult
	func deselectedBorderColor(_ deselectedBorderColor: SystemColor) -> Self { self.deselectedBorderColor = deselectedBorderColor; return self }
	
	@discardableResult
	func selectedBorderWidth(_ selectedBorderWidth: CGFloat) -> Self { self.selectedBorderWidth = selectedBorderWidth; return self }
	
	@discardableResult
	func deselectedBorderWidth(_ deselectedBorderWidth: CGFloat) -> Self { self.deselectedBorderWidth = deselectedBorderWidth; return self }
	
	@discardableResult
	func padding(_ padding: ViewPadding) -> Self { self.padding = padding; return self }
	
	@discardableResult
	func clearButtonColor(_ clearButtonColor: SystemColor) -> Self { self.clearButtonColor = clearButtonColor; return self }
}

//MARK: Copy Support
public extension NitrozenAppearance.TagView {
	var copy: NitrozenAppearance.TagView {
		.init(
			selectedTitle: self.selectedTitle.copy,
			deSelectedTitle: self.deSelectedTitle.copy,
			selectedBorderColor: self.selectedBorderColor,
			deselectedBorderColor: self.deselectedBorderColor,
			selectedBorderWidth: self.selectedBorderWidth,
			deselectedBorderWidth: self.deselectedBorderWidth,
			padding: self.padding,
			clearButtonColor: self.clearButtonColor
		)
	}
}
