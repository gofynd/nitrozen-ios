//
//  PageControl+Appearance.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 10/04/23.
//

import Foundation

public extension NitrozenAppearance {
	class PageControl {
		var selectedColor: SystemColor
		var deselectedColor: SystemColor
		
		var selectedSize: CGSize
		var deSelectedSize: CGSize
		
		var selectedBorderColor: SystemColor
		var deselectedBorderColor: SystemColor
		
		var selectedBorderWidth: CGFloat
		var deselectedBorderWidth: CGFloat
		
		var selectedViewShape: ViewShape
		var deselectedViewShape: ViewShape
		
		
		var spacing: CGFloat
		
		init(selectedColor: SystemColor, deselectedColor: SystemColor,
			 selectedSize: CGSize, deSelectedSize: CGSize,
			 selectedBorderColor: SystemColor, deselectedBorderColor: SystemColor,
			 selectedBorderWidth: CGFloat, deselectedBorderWidth: CGFloat,
			 selectedViewShape: ViewShape, deselectedViewShape: ViewShape,
			 spacing: CGFloat
		) {
			self.selectedColor = selectedColor
			self.deselectedColor = deselectedColor
			self.selectedSize = selectedSize
			self.deSelectedSize = deSelectedSize
			self.selectedBorderColor = selectedBorderColor
			self.deselectedBorderColor = deselectedBorderColor
			self.selectedBorderWidth = selectedBorderWidth
			self.deselectedBorderWidth = deselectedBorderWidth
			self.selectedViewShape = selectedViewShape
			self.deselectedViewShape = deselectedViewShape
			self.spacing = spacing
		}
	}
}

public extension NitrozenAppearance.PageControl {
	@discardableResult
	func selectedColor(_ selectedColor: SystemColor) -> Self { self.selectedColor = selectedColor; return self }
	
	@discardableResult
	func deselectedColor(_ deselectedColor: SystemColor) -> Self { self.deselectedColor = deselectedColor; return self }
	
	@discardableResult
	func selectedSize(_ selectedSize: CGSize) -> Self { self.selectedSize = selectedSize; return self }
	
	@discardableResult
	func deSelectedSize(_ deSelectedSize: CGSize) -> Self { self.deSelectedSize = deSelectedSize; return self }
	
	@discardableResult
	func selectedBorderColor(_ selectedBorderColor: SystemColor) -> Self { self.selectedBorderColor = selectedBorderColor; return self }
	
	@discardableResult
	func deselectedBorderColor(_ deselectedBorderColor: SystemColor) -> Self { self.deselectedBorderColor = deselectedBorderColor; return self }
	
	@discardableResult
	func selectedBorderWidth(_ selectedBorderWidth: CGFloat) -> Self { self.selectedBorderWidth = selectedBorderWidth; return self }
	
	@discardableResult
	func deselectedBorderWidth(_ deselectedBorderWidth: CGFloat) -> Self { self.deselectedBorderWidth = deselectedBorderWidth; return self }
	
	@discardableResult
	func selectedViewShape(_ selectedViewShape: ViewShape) -> Self { self.selectedViewShape = selectedViewShape; return self }
	
	@discardableResult
	func deselectedViewShape(_ deselectedViewShape: ViewShape) -> Self { self.deselectedViewShape = deselectedViewShape; return self }
    
    @discardableResult
    func spacing(_ spacing: CGFloat) -> Self { self.spacing = spacing; return self }
}

//MARK: Copy Support
public extension NitrozenAppearance.PageControl {
	var copy: NitrozenAppearance.PageControl {
		.init(
			selectedColor: self.selectedColor,
			deselectedColor: self.deselectedColor,
			selectedSize: self.selectedSize,
			deSelectedSize: self.deSelectedSize,
			selectedBorderColor: self.selectedBorderColor,
			deselectedBorderColor: self.deselectedBorderColor,
			selectedBorderWidth: self.selectedBorderWidth,
			deselectedBorderWidth: self.deselectedBorderWidth,
			selectedViewShape: self.selectedViewShape,
			deselectedViewShape: self.deselectedViewShape,
			spacing: self.spacing
		)
	}
}
