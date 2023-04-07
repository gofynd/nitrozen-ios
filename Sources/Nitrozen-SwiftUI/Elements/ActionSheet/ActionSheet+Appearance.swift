//
//  ActionSheet+Appearance.swift
//  Nitrozen-SwiftUI
//
//  Created by Rushang Prajapati on 07/04/23.
//

import SwiftUI

public extension NitrozenAppearance {
	class ActionSheet {
		public var title: NitrozenAppearance.TextLabel
		public var subTitle: NitrozenAppearance.TextLabel

		init(
			title:NitrozenAppearance.TextLabel,
			subTitle:NitrozenAppearance.TextLabel
		) {
			self.title = title
			self.subTitle = subTitle
		}
	}
}


public extension NitrozenAppearance.ActionSheet {
	@discardableResult
	func title(_ title: NitrozenAppearance.TextLabel) -> Self { self.title = title; return self }
	
	@discardableResult
	func subTitle(_ subTitle: NitrozenAppearance.TextLabel) -> Self { self.subTitle = subTitle; return self }

}

//MARK: Copy Support
public extension NitrozenAppearance.ActionSheet {
	var copy: NitrozenAppearance.ActionSheet {
		.init(
			title: self.title.copy,
			subTitle: self.subTitle.copy
		)
	}
}
