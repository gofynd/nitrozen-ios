//
//  Checkbox+Appearance.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 05/04/23.
//

import SwiftUI

public extension NitrozenAppearance {
	class Checkbox {
		public var selectedTitle: NitrozenAppearance.TextLabel
		public var deSelectedTitle: NitrozenAppearance.TextLabel
		
		var selectedBorderColor: SystemColor
		var deSelectedBorderColor: SystemColor
		
		var selectedBorderWidth: CGFloat
		var deselectedBorderWidth: CGFloat
		var size: CGSize
		
		var selectedImage: AnyView
		
		init(selectedTitle: NitrozenAppearance.TextLabel, deSelectedTitle: NitrozenAppearance.TextLabel,
			 selectedBorderColor: SystemColor, deSelectedBorderColor: SystemColor,
			 selectedBorderWidth: CGFloat, deselectedBorderWidth: CGFloat,
			 size: CGSize,
			 selectedImage: AnyView
		) {
			self.selectedTitle = selectedTitle
			self.deSelectedTitle = deSelectedTitle
			self.selectedBorderColor = selectedBorderColor
			self.deSelectedBorderColor = deSelectedBorderColor
			self.selectedBorderWidth = selectedBorderWidth
			self.deselectedBorderWidth = deselectedBorderWidth
			self.size = size
			self.selectedImage = selectedImage
		}
	}
}


public extension NitrozenAppearance.Checkbox {
	@discardableResult
	func selectedTitle(_ selectedTitle: NitrozenAppearance.TextLabel) -> Self { self.selectedTitle = selectedTitle; return self }
	
	@discardableResult
	func deSelectedTitle(_ deSelectedTitle: NitrozenAppearance.TextLabel) -> Self { self.deSelectedTitle = deSelectedTitle; return self }
	
	@discardableResult
	func selectedBorderColor(_ selectedBorderColor: SystemColor) -> Self { self.selectedBorderColor = selectedBorderColor; return self }
	
	@discardableResult
	func deselectedBorderColor(_ deSelectedBorderColor: SystemColor) -> Self { self.deSelectedBorderColor = deSelectedBorderColor; return self }
	
	@discardableResult
	func selectedBorderWidth(_ selectedBorderWidth: CGFloat) -> Self { self.selectedBorderWidth = selectedBorderWidth; return self }
	
	@discardableResult
	func deselectedBorderWidth(_ deselectedBorderWidth: CGFloat) -> Self { self.deselectedBorderWidth = deselectedBorderWidth; return self }
	
	@discardableResult
	func size(_ size: CGSize) -> Self { self.size = size; return self }
	
	@discardableResult
	func selectedImage(_ selectedImage: AnyView) -> Self { self.selectedImage = selectedImage; return self }
}

//MARK: Copy Support
public extension NitrozenAppearance.Checkbox {
	var copy: NitrozenAppearance.Checkbox {
		.init(selectedTitle: self.selectedTitle.copy, deSelectedTitle: self.deSelectedTitle.copy,
			  selectedBorderColor: self.selectedBorderColor, deSelectedBorderColor: self.deSelectedBorderColor,
			  selectedBorderWidth: self.selectedBorderWidth, deselectedBorderWidth: self.deselectedBorderWidth,
			  size: self.size,
			  selectedImage: self.selectedImage
		)
	}
}
