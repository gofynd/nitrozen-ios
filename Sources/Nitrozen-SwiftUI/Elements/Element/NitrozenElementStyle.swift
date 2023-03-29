//
//  NitrozenElementStyle.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 18/03/23.
//

import SwiftUI

public typealias ElementTap = () -> ()

//base protocol
protocol NitrozenElementStyle { }

enum NitrozenElementLoaderSize { case defaultSize, custom(size: CGSize) }

/// Any ElementStyle like NitrozenButtonStyle or NitrozenTextStyle that will support loading will confirm this protocol
/// Future plan: Allow access to loader customization with the help of this protocol -- to support O of SOLID
protocol NitrozenElementLoadingStyle: NitrozenElementStyle {
	
	var isLoading: Bool { get set }
	var loaderSize: NitrozenElementLoaderSize { get set }
	
	@discardableResult
	mutating func isLoading(_ isLoading: Bool) -> Self
}

extension View {
	func apply(elementStyle: NitrozenElementStyle) -> some View {
		Group {
			(elementStyle as? NitrozenButtonStyle).convert { style in
				self.apply(buttonStyle: style)
			}
			
			(elementStyle as? NitrozenTextStyle).convert { style in
				self.apply(textStyle: style)
			}
		}
	}
}
