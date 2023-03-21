//
//  Text+ViewHelper.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 17/03/23.
//

import SwiftUI

//MARK: Text Helper -> Public APIs
public extension View {
	
	func headingXS(isLoading: Binding<Bool> = .constant(false)) -> some View {
		let style = nitrozenTextLabelStyle(forAppearance: NitrozenAppearance.shared.headingXS)
		return self.loading(isLoading: isLoading, style: style)
	}
	
	func headingXXS(isLoading: Binding<Bool> = .constant(false)) -> some View {
		let style = nitrozenTextLabelStyle(forAppearance: NitrozenAppearance.shared.headingXXS)
		return self.loading(isLoading: isLoading, style: style)
	}
	
	func subHeadingS(isLoading: Binding<Bool> = .constant(false)) -> some View {
		let style = nitrozenTextLabelStyle(forAppearance: NitrozenAppearance.shared.subHeadingS)
		return self.loading(isLoading: isLoading, style: style)
	}
	
	func bodyXS(isLoading: Binding<Bool> = .constant(false)) -> some View {
		let style = nitrozenTextLabelStyle(forAppearance: NitrozenAppearance.shared.bodyXS)
		return self.loading(isLoading: isLoading, style: style)
	}
	
	func labelXXS(isLoading: Binding<Bool> = .constant(false)) -> some View {
		let style = nitrozenTextLabelStyle(forAppearance: NitrozenAppearance.shared.labelXXS)
		return self.loading(isLoading: isLoading, style: style)
	}
}

fileprivate extension View {
	func nitrozenTextLabelStyle(forAppearance: NitrozenAppearance.TextLable) -> NitrozenTextStyle {
		return NitrozenTextStyle(
			textColor: forAppearance.titleColor,
			font: forAppearance.font,
			isLoading: false,
			loaderSize: .defaultSize
		)
	}
}
