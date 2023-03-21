//
//  Button+Appearance.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 16/03/23.
//

import Foundation

public extension NitrozenAppearance {
	class Button {
		enum StyleUseCase { case primary, bordered, tertiary, custom }
		
		var styleUseCase: StyleUseCase
		
		var titleColor: SystemColor
		var titleColorDisabled: SystemColor
		var backgroundColor: SystemColor
		var backgroundColorDisabled: SystemColor
		var font: SystemFont
		var borderWidth: Double
		
		init(styleUseCase: StyleUseCase,
			 title: SystemColor, titleDisabled: SystemColor,
			 background: SystemColor, backgroundDisabled: SystemColor,
			 font: SystemFont, borderWidth: Double) {
			
			self.styleUseCase = styleUseCase
			self.titleColor = title
			self.titleColorDisabled = titleDisabled
			self.backgroundColor = background
			self.backgroundColorDisabled = backgroundDisabled
			self.font = font
			self.borderWidth = borderWidth
		}
	}
}


public extension NitrozenAppearance.Button {
	@discardableResult
	func titleColor(_ titleColor: SystemColor) -> Self { self.titleColor = titleColor; return self }
	
	@discardableResult
	func titleColorDisabled(_ titleDisabled: SystemColor) -> Self { self.titleColorDisabled = titleDisabled; return self }
	
	@discardableResult
	func backgroundColor(_ background: SystemColor) -> Self { self.backgroundColor = background; return self }
	
	@discardableResult
	func backgroundColorDisabled(_ backgroundDisabled: SystemColor) -> Self { self.backgroundColorDisabled = backgroundDisabled; return self }
	
	@discardableResult
	func font(_ font: SystemFont) -> Self { self.font = font; return self }
	
	@discardableResult
	func borderWidth(_ borderWidth: Double) -> Self { self.borderWidth = borderWidth; return self }
}
