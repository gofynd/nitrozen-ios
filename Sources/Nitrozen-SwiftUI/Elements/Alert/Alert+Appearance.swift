//
//  Alert+Appearance.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 06/04/23.
//

import SwiftUI

public extension NitrozenAppearance {
	class Alert {
		public var title: NitrozenAppearance.TextLabel
		public var subtitle: NitrozenAppearance.TextLabel
		public var closeButtonColor: SystemColor
        var topImagePadding: ViewPadding
        var titlePadding: ViewPadding
        var subTitlePaddding: ViewPadding
		
		init(
			title: NitrozenAppearance.TextLabel,
			subtitle: NitrozenAppearance.TextLabel,
			closeButtonColor: SystemColor,
            topImagePadding: ViewPadding,
            titlePadding: ViewPadding,
            subTitlePaddding: ViewPadding
		) {
			self.title = title
			self.subtitle = subtitle
			self.closeButtonColor = closeButtonColor
            self.topImagePadding = topImagePadding
            self.titlePadding = titlePadding
            self.subTitlePaddding = subTitlePaddding
		}
	}
}

public extension NitrozenAppearance.Alert {
	@discardableResult
	func title(_ title: NitrozenAppearance.TextLabel) -> Self { self.title = title; return self }
	
	@discardableResult
	func subtitle(_ subtitle: NitrozenAppearance.TextLabel) -> Self { self.subtitle = subtitle; return self }
	
	@discardableResult
	func closeButtonColor(_ closeButtonColor: SystemColor) -> Self { self.closeButtonColor = closeButtonColor; return self }
    
    @discardableResult
    func titlePadding(_ titlePadding: ViewPadding) -> Self { self.titlePadding = titlePadding; return self }
    
    @discardableResult
    func subTitlePaddding(_ subTitlePaddding: ViewPadding) -> Self { self.subTitlePaddding = subTitlePaddding; return self }
    
    @discardableResult
    func topImagePadding(_ topImagePadding: ViewPadding) -> Self { self.topImagePadding = topImagePadding; return self }
    
}

//MARK: Copy Support
public extension NitrozenAppearance.Alert {
	var copy: NitrozenAppearance.Alert {
		.init(
			title: self.title.copy,
			subtitle: self.subtitle.copy,
			closeButtonColor: self.closeButtonColor,
            topImagePadding: self.topImagePadding,
            titlePadding: self.titlePadding,
            subTitlePaddding: self.subTitlePaddding
		)
	}
}
