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
		var height: CGFloat
		
		var borderColor: SystemColor
		var borderWidth: CGFloat
		var borderRadius: CGFloat
		var fillBorderColor: SystemColor
		
		
		init(
			textStyle: NitrozenAppearance.TextLabel,
			placeHolderStyle: NitrozenAppearance.TextLabel,
			height: CGFloat,
			borderColor: SystemColor,
			borderWidth: CGFloat,
			borderRadius: CGFloat,
			fillBorderColor: SystemColor) {
				self.textStyle = textStyle
				self.placeHolderStyle = placeHolderStyle
				self.height = height
				
				self.borderColor = borderColor
				self.borderWidth = borderWidth
				self.borderRadius = borderRadius
				self.fillBorderColor = fillBorderColor
			}
		
	}
}


public extension NitrozenAppearance.OTPTextView {
	@discardableResult
	func textStyle(_ textStyle: NitrozenAppearance.TextLabel) -> Self { self.textStyle = textStyle; return self }
	
	@discardableResult
	func placeHolderStyle(_ placeHolderStyle: NitrozenAppearance.TextLabel) -> Self { self.placeHolderStyle = placeHolderStyle; return self }
	
	
	@discardableResult
	func height(_ spacing: CGFloat) -> Self { self.height = spacing; return self }
	
	
	@discardableResult
	func borderColor(_ borderColor: SystemColor) -> Self { self.borderColor = borderColor; return self }
	
	@discardableResult
	func borderWidth(_ borderWidth: CGFloat) -> Self { self.borderWidth = borderWidth; return self }
		
	@discardableResult
	func borderRadius(_ borderRadius: CGFloat) -> Self { self.borderRadius = borderRadius; return self }
	
	@discardableResult
	func fillBorderColor(_ fillBorderColor: SystemColor) -> Self { self.fillBorderColor = fillBorderColor; return self }
	
}

//MARK: Copy Support
public extension NitrozenAppearance.OTPTextView {
	var copy: NitrozenAppearance.OTPTextView {
		.init(textStyle: self.textStyle,
			  placeHolderStyle: self.placeHolderStyle,
			  height: self.height,
			  borderColor: self.borderColor,
			  borderWidth: self.borderWidth,
			  borderRadius: self.borderRadius,
			  fillBorderColor: self.fillBorderColor)
	}
}
