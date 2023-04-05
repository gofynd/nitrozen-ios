//
//  Checkbox+Appearance.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 05/04/23.
//

import SwiftUI

public extension NitrozenAppearance {
	class Checkbox {
		var selectedTitle: NitrozenAppearance.TextLabel
		var deSelectedTitle: NitrozenAppearance.TextLabel
		
		var selectedColor: SystemColor
		var deselectedColor: SystemColor
		
		var selectedBorderWidth: CGFloat
		var deselectedBorderWidth: CGFloat
		var size: CGSize
		
		var selectedImage: AnyView
		
		init(selectedTitle: NitrozenAppearance.TextLabel, deSelectedTitle: NitrozenAppearance.TextLabel,
			 selectedColor: SystemColor, deselectedColor: SystemColor,
			 selectedBorderWidth: CGFloat, deselectedBorderWidth: CGFloat,
			 size: CGSize,
			 selectedImage: AnyView
		) {
			self.selectedTitle = selectedTitle
			self.deSelectedTitle = deSelectedTitle
			self.selectedColor = selectedColor
			self.deselectedColor = deselectedColor
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
	func selectedColor(_ selectedColor: SystemColor) -> Self { self.selectedColor = selectedColor; return self }
	
	@discardableResult
	func deselectedColor(_ deselectedColor: SystemColor) -> Self { self.deselectedColor = deselectedColor; return self }
	
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
			  selectedColor: self.selectedColor, deselectedColor: self.deselectedColor,
			  selectedBorderWidth: self.selectedBorderWidth, deselectedBorderWidth: self.deselectedBorderWidth,
			  size: self.size,
			  selectedImage: self.selectedImage
		)
	}
}
