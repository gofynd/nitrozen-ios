//
//  Button+ViewHelper.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 17/03/23.
//

import SwiftUI

//MARK: Button Helper -> Public APIs
public extension View {
	
	func primaryButton(isLoading: Binding<Bool> = .constant(false), shape: ViewShape = .capsule, appearance: NitrozenAppearance.Button = NitrozenAppearance.shared.primaryButton, viewPadding: ViewPadding? = nil) -> some View {
		var style = nitrozenButtonStyle(forAppearance: appearance, withShape: shape)
		style.padding(viewPadding.or(self.buttonPadding(shape: shape)))
		return self.loading(isLoading: isLoading, style: style)
	}
	
	func borderedButton(isLoading: Binding<Bool> = .constant(false), shape: ViewShape = .capsule, appearance: NitrozenAppearance.Button = NitrozenAppearance.shared.borderedButton, viewPadding: ViewPadding? = nil) -> some View {
		var style = nitrozenButtonStyle(forAppearance: appearance, withShape: shape)
		style.padding(viewPadding.or(self.buttonPadding(shape: shape)))
		return self.loading(isLoading: isLoading, style: style)
	}
	
	func tertiaryButton(isLoading: Binding<Bool> = .constant(false), appearance: NitrozenAppearance.Button = NitrozenAppearance.shared.tertiaryButton, viewPadding: ViewPadding? = nil) -> some View {
		var style = nitrozenButtonStyle(forAppearance: appearance, withShape: .none)
		style.padding(viewPadding.or(self.buttonPadding(shape: .none)))
		return self.loading(isLoading: isLoading, style: style)
	}
}

fileprivate extension View {
	func nitrozenButtonStyle(forAppearance: NitrozenAppearance.Button, withShape: ViewShape) -> NitrozenButtonStyle {
		//padding and loading -> will be decided based on shape and modified later
		return NitrozenButtonStyle(
			styleUseCase: forAppearance.styleUseCase,
			shapeUseCase: withShape,
			backgroundColor: forAppearance.backgroundColor,
			backgroundColorDisabled: forAppearance.backgroundColorDisabled,
			textColor: forAppearance.titleColor,
			textColorDisabled: forAppearance.titleColorDisabled,
			font: forAppearance.font,
			borderWidth: forAppearance.borderWidth,
			borderColor: forAppearance.borderColor,
			borderColorDisabled: forAppearance.borderColorDisabled,
			padding: .zero,
			isLoading: false
		)
	}
	
	func buttonPadding(shape: ViewShape) -> ViewPadding {
		switch shape {
		case .none:
			return .zero
		case .roundedRectangle:
			return .sytemDefaultAddingCustom(paddingToAdd: .init(top: -6, leading: 6, bottom: -6, trailing: 6))
		case .circle:
			return .systemDefault
		case .capsule:
			return .sytemDefaultAddingCustom(paddingToAdd: .init(top: -6, leading: 8, bottom: -6, trailing: 8))
		}
	}
}
