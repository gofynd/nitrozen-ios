//
//  Textfield+Appearance.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 28/03/23.
//

import Foundation
import FloatingTextField_SwiftUI

public extension NitrozenAppearance {
	//TODO: define protocol textApperancable for titleColor and font
	class TextField {
		var topInfo: TextLabel
		var sucessInfo: TextLabel
		var errorInfo: TextLabel
		
		var titleColor: SystemColor
		var font: SystemFont
		var borderAppearance: FloatingTextField_SwiftUI.Modifiers.Rounded.Configuration
		
		
		init(
			titleColor: SystemColor, font: SystemFont,
			topInfo: TextLabel,
			sucessInfo: TextLabel, errorInfo: TextLabel,
			borderAppearance: FloatingTextField_SwiftUI.Modifiers.Rounded.Configuration
		) {
			self.titleColor = titleColor
			self.font = font
			self.borderAppearance = borderAppearance
			
			self.topInfo = topInfo
			self.sucessInfo = sucessInfo
			self.errorInfo = errorInfo
		}
	}
}


public extension NitrozenAppearance.TextField {
	@discardableResult
	func titleColor(_ titleColor: SystemColor) -> Self { self.titleColor = titleColor; return self }
	
	@discardableResult
	func font(_ font: SystemFont) -> Self { self.font = font; return self }
	
	@discardableResult
	func topInfo(_ topInfo: NitrozenAppearance.TextLabel) -> Self { self.topInfo = topInfo; return self }
	
	@discardableResult
	func sucessInfo(_ sucessInfo: NitrozenAppearance.TextLabel) -> Self { self.sucessInfo = sucessInfo; return self }
	
	@discardableResult
	func errorInfo(_ errorInfo: NitrozenAppearance.TextLabel) -> Self { self.errorInfo = errorInfo; return self }
	
	@discardableResult
	func borderAppearance(_ borderAppearance: FloatingTextField_SwiftUI.Modifiers.Rounded.Configuration) -> Self { self.borderAppearance = borderAppearance; return self }
}

//MARK: Copy Support
public extension NitrozenAppearance.TextField {
	var copy: NitrozenAppearance.TextField {
		.init(
			titleColor: self.titleColor, font: self.font,
			topInfo: self.topInfo.copy,
			sucessInfo: self.sucessInfo.copy,
			errorInfo: self.errorInfo.copy,
			borderAppearance: self.borderAppearance.copy
		)
	}
}
