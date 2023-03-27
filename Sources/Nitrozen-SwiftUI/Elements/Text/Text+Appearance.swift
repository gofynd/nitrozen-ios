//
//  Text+Appearance.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 20/03/23.
//

import Foundation

public extension NitrozenAppearance {
	class TextLabel {
		var titleColor: SystemColor
		var font: SystemFont
		
		init(titleColor: SystemColor, font: SystemFont) {
			self.titleColor = titleColor
			self.font = font
		}
	}
}

public extension NitrozenAppearance.TextLabel {
	@discardableResult
	func titleColor(_ titleColor: SystemColor) -> Self { self.titleColor = titleColor; return self }
	
	@discardableResult
	func font(_ font: SystemFont) -> Self { self.font = font; return self }
}

//MARK: Copy Support
public extension NitrozenAppearance.TextLabel {
	var copy: NitrozenAppearance.TextLabel {
		.init(titleColor: self.titleColor, font: self.font)
	}
}
