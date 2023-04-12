//
//  OtpTextView+Appearance.swift
//  
//
//  Created by Keyur Patel on 11/04/23.
//

import Foundation

public extension NitrozenAppearance {
	//TODO: define protocol textApperancable for titleColor and font
	class OTPTextView {
		
		var textStyle: NitrozenAppearance.TextLabel
		var placeHolderStyle: NitrozenAppearance.TextLabel
		var size: CGSize
		
		var borderColor: SystemColor
		var borderWidth: CGFloat
		var borderRadius: CGFloat
		var fillBorderColor: SystemColor
		var focusedBorderColor: SystemColor
		var errorColor: SystemColor
		var successColor: SystemColor
		
		init(
			textStyle: NitrozenAppearance.TextLabel,
			placeHolderStyle: NitrozenAppearance.TextLabel,
			size: CGSize,
			borderColor: SystemColor,
			borderWidth: CGFloat,
			borderRadius: CGFloat,
			fillBorderColor: SystemColor,
			focusedBorderColor: SystemColor,
			errorColor: SystemColor,
			successColor: SystemColor) {
				
				self.textStyle = textStyle
				self.placeHolderStyle = placeHolderStyle
				self.size = size
				
				self.borderColor = borderColor
				self.borderWidth = borderWidth
				self.borderRadius = borderRadius
				self.fillBorderColor = fillBorderColor
				self.focusedBorderColor = focusedBorderColor
				self.errorColor = errorColor
				self.successColor = successColor
			}
		
	}
}


public extension NitrozenAppearance.OTPTextView {
	@discardableResult
	func textStyle(_ textStyle: NitrozenAppearance.TextLabel) -> Self { self.textStyle = textStyle; return self }
	
	@discardableResult
	func placeHolderStyle(_ placeHolderStyle: NitrozenAppearance.TextLabel) -> Self { self.placeHolderStyle = placeHolderStyle; return self }
	
	
	@discardableResult
	func size(_ size: CGSize) -> Self { self.size = size; return self }
	
	
	@discardableResult
	func borderColor(_ borderColor: SystemColor) -> Self { self.borderColor = borderColor; return self }
	
	@discardableResult
	func borderWidth(_ borderWidth: CGFloat) -> Self { self.borderWidth = borderWidth; return self }
		
	@discardableResult
	func borderRadius(_ borderRadius: CGFloat) -> Self { self.borderRadius = borderRadius; return self }
	
	@discardableResult
	func fillBorderColor(_ fillBorderColor: SystemColor) -> Self { self.fillBorderColor = fillBorderColor; return self }
	
	@discardableResult
	func focusedBorderColor(_ focusedBorderColor: SystemColor) -> Self { self.focusedBorderColor = focusedBorderColor; return self }
	
	@discardableResult
	func errorColor(_ errorColor: SystemColor) -> Self { self.errorColor = errorColor; return self }
	
	@discardableResult
	func successColor(_ bordersuccessColorColor: SystemColor) -> Self { self.successColor = successColor; return self }
	
}

//MARK: Copy Support
public extension NitrozenAppearance.OTPTextView {
	var copy: NitrozenAppearance.OTPTextView {
		.init(textStyle: self.textStyle,
			  placeHolderStyle: self.placeHolderStyle,
			  size: self.size,
			  borderColor: self.borderColor,
			  borderWidth: self.borderWidth,
			  borderRadius: self.borderRadius,
			  fillBorderColor: self.fillBorderColor,
			  focusedBorderColor: self.focusedBorderColor,
			  errorColor: self.errorColor,
			  successColor: self.successColor)
	}
}
