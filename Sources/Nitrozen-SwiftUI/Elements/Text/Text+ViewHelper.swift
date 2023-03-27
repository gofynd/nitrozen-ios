//
//  Text+ViewHelper.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 17/03/23.
//

import SwiftUI

//MARK: Text Helper -> Public APIs
public extension View {
	
	func headingXS(isLoading: Binding<Bool> = .constant(false), appearance: NitrozenAppearance.TextLabel = NitrozenAppearance.shared.headingXS) -> some View {
		let style = nitrozenTextLabelStyle(forAppearance: appearance)
		return self.loading(isLoading: isLoading, style: style)
	}
	
	func headingXXS(isLoading: Binding<Bool> = .constant(false), appearance: NitrozenAppearance.TextLabel = NitrozenAppearance.shared.headingXXS) -> some View {
		let style = nitrozenTextLabelStyle(forAppearance: appearance)
		return self.loading(isLoading: isLoading, style: style)
	}
	
	func subHeadingS(isLoading: Binding<Bool> = .constant(false), appearance: NitrozenAppearance.TextLabel = NitrozenAppearance.shared.subHeadingS) -> some View {
		let style = nitrozenTextLabelStyle(forAppearance: appearance)
		return self.loading(isLoading: isLoading, style: style)
	}
	
	func bodyXS(isLoading: Binding<Bool> = .constant(false), appearance: NitrozenAppearance.TextLabel = NitrozenAppearance.shared.bodyXS) -> some View {
		let style = nitrozenTextLabelStyle(forAppearance: appearance)
		return self.loading(isLoading: isLoading, style: style)
	}
	
	func labelXXS(isLoading: Binding<Bool> = .constant(false), appearance: NitrozenAppearance.TextLabel = NitrozenAppearance.shared.labelXXS) -> some View {
		let style = nitrozenTextLabelStyle(forAppearance: appearance)
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
