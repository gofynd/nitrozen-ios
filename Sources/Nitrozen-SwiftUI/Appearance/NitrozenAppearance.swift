//
//  Appearance.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 14/03/23.
//

import SwiftUI

public class NitrozenAppearance {
	
	//Appearance.public properties
	public var colorProvider: ColorProvider
	public var fontProvider: FontProvider
	
	//Appearance.Button
	public var primaryButton: NitrozenAppearance.Button
	public var borderedButton: NitrozenAppearance.Button
	public var tertiaryButton: NitrozenAppearance.Button
	
	//Appearance.Textfield
	public var textField: NitrozenAppearance.TextField
	
	//Appearance.DropDownTextfield
	public var dropDownTextField: NitrozenAppearance.TextField
	
	
	init(
		colorProvider: ColorProvider,
		fontProvider: FontProvider,
		
		primaryButton: NitrozenAppearance.Button,
		borderedButton: NitrozenAppearance.Button,
		tertiaryButton: NitrozenAppearance.Button,
		
		textField: NitrozenAppearance.TextField,
		dropDownTextField: NitrozenAppearance.TextField
	) {
		self.colorProvider = colorProvider
		self.fontProvider = fontProvider
		self.primaryButton = primaryButton
		self.borderedButton = borderedButton
		self.tertiaryButton = tertiaryButton
		
		self.textField = textField
		self.dropDownTextField = dropDownTextField
	}
}

public extension NitrozenAppearance {
	static var shared: NitrozenAppearance = {
		let colorProvider = ColorProvider.shared
		let fontProvider = FontProvider.shared

		let disableOpacity: Double = 0.3
		
		
		let font: SystemFont = fontProvider.headingXS
		
		FontRegistar.registerJIOFonts()
		
		return .init(
			colorProvider: ColorProvider.shared,
			fontProvider: fontProvider,
			
			primaryButton: .init(styleUseCase: .primary,
								 titleColor: .white, titleColorDisabled: .white.opacity(disableOpacity),
								 backgroundColor: colorProvider.primary, backgroundColorDisabled: colorProvider.primary.opacity(disableOpacity),
								 font: font, borderWidth: 0.0),
			
			borderedButton: .init(styleUseCase: .bordered,
								  titleColor: colorProvider.primary, titleColorDisabled: colorProvider.primary.opacity(disableOpacity),
								  backgroundColor: .clear, backgroundColorDisabled: .clear,
								  font: font, borderWidth: 1.0),
			
			tertiaryButton: .init(styleUseCase: .tertiary,
								  titleColor: colorProvider.primary, titleColorDisabled: colorProvider.primary.opacity(disableOpacity),
								  backgroundColor: .clear, backgroundColorDisabled: .clear,
								  font: font, borderWidth: 1.0),
			
			textField: .init(
				titleColor: colorProvider.primary, font: .body,
				topInfo: .init(titleColor: .gray, font: .caption),
				sucessInfo: .init(titleColor: .green, font: .callout),
				errorInfo: .init(titleColor: .red, font: .callout),
				
				borderAppearance: .init()
					.borderColor(.gray)
					.borderWidth(1.0)
					.borderPadding(6)
			),
			
			dropDownTextField: .init(
				titleColor: colorProvider.primary, font: .body,
				topInfo: .init(titleColor: .gray, font: .caption),
				sucessInfo: .init(titleColor: .green, font: .callout),
				errorInfo: .init(titleColor: .red, font: .callout),
				
				borderAppearance: .init()
					.borderColor(.purple)
					.borderWidth(1.0)
					.borderPadding(6)
			)
			
		)
	}()
}

//MARK: Copy Support
public extension NitrozenAppearance {
	var copy: NitrozenAppearance {
		return .init(
			colorProvider: self.colorProvider.copy,
			fontProvider: self.fontProvider.copy,
			primaryButton: self.primaryButton.copy,
			borderedButton: self.borderedButton.copy,
			tertiaryButton: self.tertiaryButton.copy,
			textField: self.textField.copy,
			dropDownTextField: self.dropDownTextField.copy
		)
	}
}
