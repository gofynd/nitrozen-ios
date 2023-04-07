//
//  PresentSheet+Appearance.swift
//  Nitrozen-SwiftUI
//
//  Created by Rushang Prajapati on 07/04/23.
//

import SwiftUI

public extension NitrozenAppearance {
	class PresentSheet {
		public var focusOpacity: CGFloat

		init(focusOpacity:CGFloat) {
			self.focusOpacity = focusOpacity
		}
	}
}


public extension NitrozenAppearance.PresentSheet {
	@discardableResult
	func focusOpacity(_ focusOpacity: CGFloat) -> Self { self.focusOpacity = focusOpacity; return self }
}

//MARK: Copy Support
public extension NitrozenAppearance.PresentSheet {
	var copy: NitrozenAppearance.PresentSheet {
		.init(focusOpacity: self.focusOpacity)
	}
}
