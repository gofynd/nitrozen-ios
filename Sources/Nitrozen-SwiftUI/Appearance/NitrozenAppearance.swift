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

	public var radioButton: NitrozenAppearance.RadioButton

	//check box
	public var checkbox: NitrozenAppearance.Checkbox
	public var actionSheet: NitrozenAppearance.ActionSheet
	public var presentSheet: NitrozenAppearance.PresentSheet

	//alert
	public var alert: NitrozenAppearance.Alert
	
	//tagView
	public var tagView: NitrozenAppearance.TagView
	
	//pageControl
	public var pageControl: NitrozenAppearance.PageControl
	
	//
	public var otpTextView: NitrozenAppearance.OTPTextView

	init(
		colorProvider: ColorProvider,
		fontProvider: FontProvider,

		primaryButton: NitrozenAppearance.Button,
		borderedButton: NitrozenAppearance.Button,
		tertiaryButton: NitrozenAppearance.Button,

		textField: NitrozenAppearance.TextField,
		dropDownTextField: NitrozenAppearance.TextField,
		radioButton: NitrozenAppearance.RadioButton,
		checkbox: NitrozenAppearance.Checkbox,
		actionSheet: NitrozenAppearance.ActionSheet,
		presentSheet: NitrozenAppearance.PresentSheet,
		alert: NitrozenAppearance.Alert,
		
		tagView: NitrozenAppearance.TagView,
		pageControl: NitrozenAppearance.PageControl,
		
		otpTextView: NitrozenAppearance.OTPTextView
	) {
		self.colorProvider = colorProvider
		self.fontProvider = fontProvider
		self.primaryButton = primaryButton
		self.borderedButton = borderedButton
		self.tertiaryButton = tertiaryButton

		self.textField = textField
		self.dropDownTextField = dropDownTextField
		self.radioButton = radioButton
		self.checkbox = checkbox
		self.actionSheet = actionSheet
		self.presentSheet = presentSheet
		self.alert = alert
		
		self.tagView = tagView
		self.pageControl = pageControl
		
		self.otpTextView = otpTextView
	}
}

public extension NitrozenAppearance {
	static var shared: NitrozenAppearance = {
		let colorProvider = ColorProvider.shared
		let fontProvider = FontProvider.shared
		
		let disableOpacity: Double = 0.3
		
		
		let font: SystemFont = .nitrozen(.body(size: .l, weight: .bold))
		
		FontRegistar.registerJIOFonts()
		
		return NitrozenAppearance.init(
			colorProvider: ColorProvider.shared,
			fontProvider: fontProvider,
			
			primaryButton: .init(styleUseCase: .primary,
								 titleColor: .white, titleColorDisabled: .white.opacity(disableOpacity),
								 backgroundColor: colorProvider.primary, backgroundColorDisabled: colorProvider.primary.opacity(disableOpacity),
								 font: font,
								 borderWidth: 0.0, borderColor: .clear, borderColorDisabled: .clear),
			
			borderedButton: .init(styleUseCase: .bordered,
								  titleColor: colorProvider.primary, titleColorDisabled: colorProvider.primary.opacity(disableOpacity),
								  backgroundColor: .clear, backgroundColorDisabled: .clear,
								  font: font,
								  borderWidth: 1.0, borderColor: .gray, borderColorDisabled: .gray),
			
			tertiaryButton: .init(styleUseCase: .tertiary,
								  titleColor: colorProvider.primary, titleColorDisabled: colorProvider.primary.opacity(disableOpacity),
								  backgroundColor: .clear, backgroundColorDisabled: .clear,
								  font: font,
								  borderWidth: 1.0, borderColor: .clear, borderColorDisabled: .clear),
			
			textField: textfieldAppearance(),
			
			dropDownTextField: textfieldAppearance(),
			
			radioButton: .init(
				selectedBorderColor: .blue,
				deSelectedBorderColor: .black,
				selectedBorderWidth: 5.0,
				deSelectedBorderWidth: 1.0,
				selectedTitle: .init(titleColor: .black, font: .body),
				deSelectedTitle: .init(titleColor: .gray, font: .body),
				selectedSubTitle: .init(titleColor: .gray, font: .caption),
				deSelectedSubTitle: .init(titleColor: .gray, font: .caption)
			),
			
			checkbox: .init(
				selectedTitle: .init(titleColor: colorProvider.primary, font: .title.weight(.bold)),
				deSelectedTitle: .init(titleColor: .gray, font: .title),
				selectedBorderColor: colorProvider.primary, deSelectedBorderColor: .gray.opacity(0.5),
				selectedBorderWidth: 0, deselectedBorderWidth: 1,
				size: .init(width: 32, height: 32),
				selectedImage: AnyView(
					Image(systemName: "checkmark.square.fill").resizable().scaledToFit()
				)
			),
			
			actionSheet: .init(
				title: .init(
					titleColor: colorProvider.primary,
					font: .nitrozen(.body(size: .l, weight: .bold))
				),
				subTitle: .init(
					titleColor: .gray,
					font: .nitrozen(.body(size: .s, weight: .regular))
				)
				,closeButtonColor: .blue
			),
			
			presentSheet: .init(focusOpacity: 0.5),
			
			alert: .init(
				title: .init(titleColor: .black, font: .nitrozen(.heading(size: .xs))),
				subtitle: .init(titleColor: .black.opacity(0.8), font: .nitrozen(.body(size: .s, weight: .useDefault))),
				closeButtonColor: colorProvider.primary
			),
			
			tagView: tagViewAppearance(color: colorProvider.primary, font: font),
			
			pageControl: pageControlAppearance(color: colorProvider.primary, font: font),
			
			otpTextView: otpTextViewAppearance()
		)
	}()
	
	private static func textfieldAppearance() -> NitrozenAppearance.TextField {
		.init(
			textFieldInternalTextLabel: .init(titleColor: .black, font: .nitrozen(.body(size: .s, weight: .useDefault))),
			topInfo: .init(titleColor: .gray, font: .caption),
			topInfoPadding: .custom(paddingToAdd: .init(top: 0, leading: 8, bottom: 8, trailing: 0)),
			sucessInfo: .init(titleColor: .green, font: .callout),
			successInfoPadding: .custom(paddingToAdd: .init(top: 8, leading: 8, bottom: 0, trailing: 0)),
			errorInfo: .init(titleColor: .red, font: .callout),
			errorInfoPadding: .custom(paddingToAdd: .init(top: 8, leading: 8, bottom: 0, trailing: 0)),
			borderColor: .gray,
			borderWidth: 1,
			borderPadding: .custom(paddingToAdd: .init(top: 10, leading: 10, bottom: 10, trailing: 10)),
			borderRadius: 16,
			backgroundColor: Color(UIColor.systemBackground)
		)
	}
	
	private static func tagViewAppearance(color: SystemColor, font: SystemFont) -> NitrozenAppearance.TagView {
		.init(
			selectedTitle: .init(titleColor: color, font: .nitrozen(.body(size: .l, weight: .bold))),
			deSelectedTitle: .init(titleColor: .gray, font: .nitrozen(.body(size: .l, weight: .regular))),
			selectedBorderColor: color, deselectedBorderColor: .gray,
			selectedBorderWidth: 2, deselectedBorderWidth: 1,
			selectedBackgroundColor: color.opacity(0.05), deSelectedBackgroundColor: .gray.opacity(0.05),
			padding: .systemDefault, clearButtonColor: color
		)
	}
	
	private static func pageControlAppearance(color: SystemColor, font: SystemFont) -> NitrozenAppearance.PageControl {
		.init(
			selectedColor: color, deselectedColor: .gray,
			selectedSize: .init(width: 40, height: 10), deSelectedSize: .init(width: 10, height: 10),
			selectedBorderColor: .clear, deselectedBorderColor: .clear,
			selectedBorderWidth: 2.0, deselectedBorderWidth: 4.0,
			selectedViewShape: .capsule, deselectedViewShape: .circle,
			spacing: 8
		)
	}
	
	private static func otpTextViewAppearance() -> NitrozenAppearance.OTPTextView {
		NitrozenAppearance.OTPTextView.init(textStyle: TextLabel.init(titleColor: .black, font: .nitrozen(.body(size: .s, weight: .useDefault))), placeHolderStyle: .init(titleColor: .gray, font: .nitrozen(.body(size: .s, weight: .useDefault))), height: 48, borderColor: .gray, borderWidth: 1, borderRadius: 16,fillBorderColor: .black)
	}
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
			dropDownTextField: self.dropDownTextField.copy,
			radioButton: self.radioButton.copy,
			checkbox: self.checkbox.copy,
			actionSheet: self.actionSheet.copy,
			presentSheet: self.presentSheet.copy,
			alert: self.alert.copy,
			tagView: self.tagView.copy, pageControl: self.pageControl.copy, otpTextView: self.otpTextView.copy
		)
	}
}
