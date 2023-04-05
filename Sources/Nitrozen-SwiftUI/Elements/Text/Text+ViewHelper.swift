//
//  Text+ViewHelper.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 17/03/23.
//

import SwiftUI

//MARK: Text Helper -> Public APIs
public extension View {
	
	func heading(isLoading: Binding<Bool> = .constant(false),
				 size: NitrozenFont.Size,
				 color: SystemColor = .black
	) -> some View {
		let style = nitrozenTextLabelStyle(forAppearance: .init(titleColor: color, font: .nitrozen(.heading(size: size))))
		return self.loading(isLoading: isLoading, style: style)
	}
	
	
	func body(isLoading: Binding<Bool> = .constant(false),
			  size: NitrozenFont.Size, weight: NitrozenFont.Weight,
			  color: SystemColor = .black
	) -> some View {
		let style = nitrozenTextLabelStyle(forAppearance: .init(titleColor: color, font: .nitrozen(.body(size: size, weight: weight))))
		return self.loading(isLoading: isLoading, style: style)
	}
	
	func listTitle(isLoading: Binding<Bool> = .constant(false),
			  color: SystemColor = .black
	) -> some View {
		let style = nitrozenTextLabelStyle(forAppearance: .init(titleColor: color, font: .nitrozen(.listTitle)))
		return self.loading(isLoading: isLoading, style: style)
	}
}

fileprivate extension View {
	func nitrozenTextLabelStyle(forAppearance: NitrozenAppearance.TextLabel) -> NitrozenTextStyle {
		return NitrozenTextStyle(
			textColor: forAppearance.titleColor,
			font: forAppearance.font,
			isLoading: false,
			loaderSize: .defaultSize
		)
	}
}
