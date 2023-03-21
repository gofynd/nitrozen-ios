//
//  Text+Appearance.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 20/03/23.
//

import Foundation

public extension NitrozenAppearance {
	class TextLable {
		var titleColor: SystemColor
		var font: SystemFont
		
		init(titleColor: SystemColor, font: SystemFont) {
			self.titleColor = titleColor
			self.font = font
		}
	}
}
