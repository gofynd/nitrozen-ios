//
//  Appearance.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 14/03/23.
//

import SwiftUI

public class NitrozenAppearance {
	
	init(
		colorProvider: ColorProvider,
		fontProvider: FontProvider,
		
		primaryButton: NitrozenAppearance.Button,
		borderedButton: NitrozenAppearance.Button,
		tertiaryButton: NitrozenAppearance.Button,
		
		headingXS: NitrozenAppearance.TextLabel,
		headingXXS: NitrozenAppearance.TextLabel,
		subHeadingS: NitrozenAppearance.TextLabel,
		bodyXS: NitrozenAppearance.TextLabel,
		labelXXS: NitrozenAppearance.TextLabel
	) {
		self.colorProvider = colorProvider
		self.fontProvider = fontProvider
		self.primaryButton = primaryButton
		self.borderedButton = borderedButton
		self.tertiaryButton = tertiaryButton
		
		self.headingXS = headingXS
		self.headingXXS = headingXXS
		self.subHeadingS = subHeadingS
		self.bodyXS = bodyXS
		self.labelXXS = labelXXS
	}
	
	//Appearance.public properties
	public var colorProvider: ColorProvider
	public var fontProvider: FontProvider
	
	//Appearance.Button
	public var primaryButton: NitrozenAppearance.Button
	public var borderedButton: NitrozenAppearance.Button
	public var tertiaryButton: NitrozenAppearance.Button
	
	//MARK: public properties
	public var headingXS: NitrozenAppearance.TextLabel
	public var headingXXS: NitrozenAppearance.TextLabel
	public var subHeadingS: NitrozenAppearance.TextLabel
	public var bodyXS: NitrozenAppearance.TextLabel
	public var labelXXS: NitrozenAppearance.TextLabel
	
}

public extension NitrozenAppearance {
	static var shared: NitrozenAppearance = {
		let colorProvider = ColorProvider.shared
		let fontProvider = FontProvider.shared

		let disableOpacity: Double = 0.3
		
		
		let font: SystemFont = fontProvider.headingXS
		
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
			
			headingXS: .init(titleColor: .black, font: fontProvider.headingXS),
			headingXXS: .init(titleColor: .black, font: fontProvider.headingXXS),
			subHeadingS: .init(titleColor: .black, font: fontProvider.subHeadingS),
			bodyXS: .init(titleColor: .gray, font: fontProvider.bodyXS),
			labelXXS: .init(titleColor: .gray, font: fontProvider.labelXXS)
			
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
			headingXS: self.headingXS.copy,
			headingXXS: self.headingXXS.copy,
			subHeadingS: self.subHeadingS.copy,
			bodyXS: self.bodyXS.copy,
			labelXXS: self.labelXXS.copy
		)
	}
}
