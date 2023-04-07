//
//  NitrozenButtonStyle.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 16/03/23.
//

import SwiftUI

extension NitrozenElementLoadingStyle {
	@discardableResult
	mutating func isLoading(_ isLoading: Bool) -> Self { self.isLoading = isLoading; return self }
}

struct NitrozenButtonStyle: ButtonStyle, NitrozenElementStyle, NitrozenElementLoadingStyle {
	@Environment(\.isEnabled) private var isEnabled
	
	private let styleUseCase: NitrozenAppearance.Button.StyleUseCase
	private let viewShape: ViewShape
	
	private let backgroundColor: Color
	private let backgroundColorDisabled: Color
	private let textColor: Color
	private let textColorDisabled: Color

	private let font: Font

	private let radius: CGFloat
	private let borderWidth: CGFloat
	private let borderColor: SystemColor
	private let borderColorDisabled: SystemColor
	
	private var padding: ViewPadding
	var isLoading: Bool
	var loaderSize: NitrozenElementLoaderSize

	init(
		styleUseCase: NitrozenAppearance.Button.StyleUseCase,
		shapeUseCase: ViewShape,
		
		backgroundColor: Color,
		backgroundColorDisabled: Color,
		textColor: Color,
		textColorDisabled: Color,

		font: Font,

		radius: CGFloat = 0.0,
		borderWidth: CGFloat = 0.0,
		borderColor: SystemColor,
		borderColorDisabled: SystemColor,
		padding: ViewPadding,
		isLoading: Bool = false,
		loaderSize: NitrozenElementLoaderSize = .defaultSize
	) {
		self.styleUseCase = styleUseCase
		self.viewShape = shapeUseCase
		self.backgroundColor = backgroundColor
		self.backgroundColorDisabled = backgroundColorDisabled
		self.textColor = textColor
		self.textColorDisabled = textColorDisabled
		self.font = font
		self.radius = radius
		self.borderWidth = borderWidth
		self.borderColor = borderColor
		self.borderColorDisabled = borderColorDisabled
		self.padding = padding
		self.isLoading = isLoading
		self.loaderSize = loaderSize
	}

	func makeBody(configuration: Configuration) -> some View {
		let forgroundColor = forgroundColor(configuration: configuration)
		Group {
			if self.isLoading {
				ZStack {
					configuration.label
						.opacity(0.01)
					
					/// This is not final loading indicator
					/// -- we will replace this With Nitrozen loader later, once we will have loader component ready
					LoadingIndicatorView(isLoading: self.isLoading, color: forgroundColor)
						.frame(width: 40, height: 16)
				}
			} else {
				configuration.label
			}
		}
		.font(font)
		.foregroundColor(forgroundColor)
		.apply(padding: padding)
		
		.background(backgroundView(configuration: configuration))
		.if(self.viewShape == .capsule, contentTransformer: { view in
			view
				.capsuleWithBorder(color: isEnabled ? borderColor : borderColorDisabled, lineWidth: borderWidth)
			
		})
		.if(self.viewShape == .circle, contentTransformer: { view in
			view
				.circleWithBorder(color: isEnabled ? borderColor : borderColorDisabled, lineWidth: borderWidth)
		})
		.if(self.viewShape == .none, contentTransformer: { view in
			view
		})
		.contentShape(Rectangle()) //for user interaction in all the area
		
	}
}

extension NitrozenButtonStyle {
	@discardableResult
	mutating func padding(_ padding: ViewPadding) -> Self { self.padding = padding; return self }
}

//MARK: Button Background-View
extension NitrozenButtonStyle {
	@ViewBuilder private func backgroundView(configuration: Configuration) -> some View {
		if isEnabled.isFalse {
			disabledBackground
		} else if configuration.isPressed {
			pressedBackground
		} else {
			enabledBackground
		}
	}

	private var enabledBackground: some View {
		LinearGradient(
			colors: [backgroundColor],
			startPoint: .leading,
			endPoint: .trailing)
	}

	private var disabledBackground: some View {
		LinearGradient(
			colors: [backgroundColorDisabled],
			startPoint: .leading,
			endPoint: .trailing)
	}

	private var pressedBackground: some View {
		var backgroundColor = self.backgroundColor
		if backgroundColor == .clear {
			switch styleUseCase {
			case .primary: break //no animation needed
			case .bordered:
				backgroundColor = self.textColor //YES animation needed
			case .tertiary: break //no animation needed
			case .custom: break
			}
		}
		
		return LinearGradient(
			colors: [backgroundColor.opacity(0.7)],
			startPoint: .leading,
			endPoint: .trailing)
		.opacity(0.4)
	}
}

//MARK: Button Forground-View
extension NitrozenButtonStyle {
	private func forgroundColor(configuration: Configuration) -> Color {
		if isEnabled.isFalse {
			return disabledForeground
		} else if configuration.isPressed {
			return pressedForeground
		} else {
			return enabledForeground
		}
	}

	private var enabledForeground: Color {
		textColor
	}

	private var disabledForeground: Color {
		textColorDisabled
	}

	
	private var pressedForeground: Color {
		return textColor.opacity(0.4)
	}
}


extension View {
	func apply(buttonStyle: NitrozenButtonStyle) -> some View {
		self
			.buttonStyle(buttonStyle)
	}
}
