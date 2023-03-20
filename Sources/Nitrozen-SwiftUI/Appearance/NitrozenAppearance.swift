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
		
		headingXS: NitrozenAppearance.TextLable,
		headingXXS: NitrozenAppearance.TextLable,
		subHeadingS: NitrozenAppearance.TextLable,
		bodyXS: NitrozenAppearance.TextLable,
		labelXXS: NitrozenAppearance.TextLable
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
	public var headingXS: NitrozenAppearance.TextLable
	public var headingXXS: NitrozenAppearance.TextLable
	public var subHeadingS: NitrozenAppearance.TextLable
	public var bodyXS: NitrozenAppearance.TextLable
	public var labelXXS: NitrozenAppearance.TextLable
	
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
								 title: .white, titleDisabled: .white.opacity(disableOpacity),
								 background: colorProvider.primary, backgroundDisabled: colorProvider.primary.opacity(disableOpacity),
								 font: font, borderWidth: 0.0),
			
			borderedButton: .init(styleUseCase: .bordered,
								  title: colorProvider.primary, titleDisabled: colorProvider.primary.opacity(disableOpacity),
								  background: .clear, backgroundDisabled: .clear,
								  font: font, borderWidth: 1.0),
			
			tertiaryButton: .init(styleUseCase: .tertiary,
								  title: colorProvider.primary, titleDisabled: colorProvider.primary.opacity(disableOpacity),
								  background: .clear, backgroundDisabled: .clear,
								  font: font, borderWidth: 1.0),
			
			headingXS: .init(titleColor: .black, font: fontProvider.headingXS),
			headingXXS: .init(titleColor: .black, font: fontProvider.headingXXS),
			subHeadingS: .init(titleColor: .black, font: fontProvider.subHeadingS),
			bodyXS: .init(titleColor: .gray, font: fontProvider.bodyXS),
			labelXXS: .init(titleColor: .gray, font: fontProvider.labelXXS)
			
		)
	}()
}
