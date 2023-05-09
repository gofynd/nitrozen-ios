//
//  ProgressView+Apperance.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 10/05/23.
//

import Foundation

public extension NitrozenAppearance {
	class ProgressView {
		var color: SystemColor
		var width: CGFloat
		var backgrounRingcolor: SystemColor
		
		public init(color: SystemColor, width: CGFloat, backgrounRingcolor: SystemColor) {
			self.color = color
			self.width = width
			self.backgrounRingcolor = backgrounRingcolor
		}
	}
}

public extension NitrozenAppearance.ProgressView {
	@discardableResult
	func color(_ color: SystemColor) -> Self { self.color = color; return self }
	
	@discardableResult
	func width(_ width: CGFloat) -> Self { self.width = width; return self }
	
	@discardableResult
	func backgrounRingcolor(_ backgrounRingcolor: SystemColor) -> Self { self.backgrounRingcolor = backgrounRingcolor; return self }
}

//MARK: Copy Support
public extension NitrozenAppearance.ProgressView {
	var copy: NitrozenAppearance.ProgressView {
		.init(color: self.color, width: self.width, backgrounRingcolor: self.backgrounRingcolor)
	}
}
