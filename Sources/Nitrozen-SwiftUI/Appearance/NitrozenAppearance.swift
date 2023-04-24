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
	
	public var primaryButton: NitrozenAppearance.Button
	public var borderedButton: NitrozenAppearance.Button
	public var tertiaryButton: NitrozenAppearance.Button
	
	public var textField: NitrozenAppearance.TextField
	public var dropDownTextField: NitrozenAppearance.TextField
	
	public var radioButton: NitrozenAppearance.RadioButton
	public var checkbox: NitrozenAppearance.Checkbox
	
	public var actionSheet: NitrozenAppearance.ActionSheet
	public var presentSheet: NitrozenAppearance.PresentSheet
	public var alert: NitrozenAppearance.Alert
	
	public var tagView: NitrozenAppearance.TagView
	public var pageControl: NitrozenAppearance.PageControl

	public var otpTextView: NitrozenAppearance.OTPTextView
	public var toggle: NitrozenAppearance.Toggle

    public var stapper: NitrozenAppearance.PageControl
    public var avatar: NitrozenAppearance.Avatar
	public var divider: NitrozenAppearance.Divider
	public var segment: NitrozenAppearance.Segment
    public var emptyView: NitrozenAppearance.EmptyView


	init(
		colorProvider: ColorProvider,
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
		otpTextView: NitrozenAppearance.OTPTextView,
		toggle: NitrozenAppearance.Toggle,
        stapper: NitrozenAppearance.PageControl,
        avatar: NitrozenAppearance.Avatar,
		divider: NitrozenAppearance.Divider,
		segment: NitrozenAppearance.Segment,
        emptyView: NitrozenAppearance.EmptyView
	) {
		self.colorProvider = colorProvider
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
		self.toggle = toggle
        self.stapper = stapper
        self.avatar = avatar
		self.divider = divider
		self.segment = segment
        self.emptyView = emptyView
	}
}

public extension NitrozenAppearance {
	static var shared: NitrozenAppearance = {
		let colorProvider = ColorProvider.shared
		
		let disableOpacity: Double = 0.3
		let font: SystemFont = .nitrozen(.body(size: .l, weight: .bold))
		
		FontRegistar.registerJIOFonts()
		
		return NitrozenAppearance.init(
			colorProvider: ColorProvider.shared,
			
			primaryButton: .init(styleUseCase: .primary,
								 titleColor: .white, titleColorDisabled: .white.opacity(disableOpacity),
								 backgroundColor: colorProvider.primary50, backgroundColorDisabled: colorProvider.primary50.opacity(disableOpacity),
								 font: font,
								 borderWidth: 0.0, borderColor: .clear, borderColorDisabled: .clear),
			
			borderedButton: .init(styleUseCase: .bordered,
								  titleColor: colorProvider.primary50, titleColorDisabled: colorProvider.primary50.opacity(disableOpacity),
								  backgroundColor: .clear, backgroundColorDisabled: .clear,
								  font: font,
								  borderWidth: 1.0, borderColor: .gray, borderColorDisabled: .gray),
			
			tertiaryButton: .init(styleUseCase: .tertiary,
								  titleColor: colorProvider.primary50, titleColorDisabled: colorProvider.primary50.opacity(disableOpacity),
								  backgroundColor: .clear, backgroundColorDisabled: .clear,
								  font: font,
								  borderWidth: 1.0, borderColor: .clear, borderColorDisabled: .clear),
			
			textField: textfieldAppearance(),
			
			dropDownTextField: textfieldAppearance(),
			
			radioButton: .init(
				selectedBorderColor: colorProvider.primary50,
				deSelectedBorderColor: .black,
				selectedBorderWidth: 5.0,
				deSelectedBorderWidth: 1.0,
				selectedTitle: .init(titleColor: .black, font: .body),
				deSelectedTitle: .init(titleColor: .gray, font: .body),
				selectedSubTitle: .init(titleColor: .gray, font: .caption),
                deSelectedSubTitle: .init(titleColor: .gray, font: .caption),
                iconPadding: ViewPadding.custom(paddingToAdd: .init(top: 0, leading: 0, bottom: 0, trailing: 0)),
                titlePadding: ViewPadding.custom(paddingToAdd: .init(top: 0, leading: 8, bottom: 0, trailing: 0)),
                subTitlePadding: ViewPadding.custom(paddingToAdd: .init(top: 16, leading: 0, bottom: 0, trailing: 0))
			),
			
			checkbox: .init(
				selectedTitle: .init(titleColor: colorProvider.primary50, font: .title.weight(.bold)),
				deSelectedTitle: .init(titleColor: .gray, font: .title),
				selectedBorderColor: colorProvider.primary50, deSelectedBorderColor: .gray.opacity(0.5),
				selectedBorderWidth: 0, deselectedBorderWidth: 1,
				size: .init(width: 32, height: 32),
				selectedImage: AnyView(
					Image(systemName: "checkmark.square.fill").resizable().scaledToFit()
				)
			),
			
			actionSheet: .init(
				title: .init(
					titleColor: colorProvider.primary50,
					font: .nitrozen(.body(size: .l, weight: .bold))
				),
				subTitle: .init(
					titleColor: .gray,
					font: .nitrozen(.body(size: .s, weight: .regular))
				)
				,closeButtonColor: colorProvider.primary50
			),
			
			presentSheet: .init(focusOpacity: 0.5),
			
			alert: .init(
				title: .init(titleColor: .black, font: .nitrozen(.heading(size: .xs))),
				subtitle: .init(titleColor: .black.opacity(0.8), font: .nitrozen(.body(size: .s, weight: .useDefault))),
				closeButtonColor: colorProvider.primary50
			),
			
			tagView: tagViewAppearance(color: colorProvider.primary50, font: font),
			
			pageControl: pageControlAppearance(color: colorProvider.primary50, font: font),
			
			otpTextView: otpTextViewAppearance(colorProvider: colorProvider),
			toggle: .init(
				onState: .init(
					backgroundColor: colorProvider.primary50,
					borderColor: .clear,
					borderWidth: 0.0,
					thumbColor: .white,
					thumbBorderColor: .clear,
					thumbBorderWidth: 0.0
				),
				offState: .init(
					backgroundColor: .clear,
					borderColor: .gray,
					borderWidth: 1.0,
					thumbColor: .gray,
					thumbBorderColor: .clear,
					thumbBorderWidth: 0.0
				),
				size: .init(width: 44, height: 24),
				thumbSize: .init(width: 16, height: 16),
				thumbPadding: .custom(paddingToAdd: .init(top: 4, leading: 4, bottom: 4, trailing: 4))
            ),
            stapper: stapperAppearance(color: colorProvider.primary50, font: font),
            avatar: avatarViewAppearance(colorProvider: colorProvider),
			divider: .init(
				color: colorProvider.gray20,
				layout: .horizontal(height: 1),
				shape: .capsule
			),
			
			segment: .init(
				backgroundColor: colorProvider.gray20,
				borderColor: colorProvider.gray20,
				borderWidth: 3,
				viewShape: .capsule,
				titleAppearance: .init(titleColor: colorProvider.primary60, font: .nitrozen(.body(size: .s, weight: .useDefault))),
				selectedBackgroundColor: colorProvider.primary50,
				selectedBorderColor: .clear,
				selectedBorderWidth: 0,
				selectedTitleAppearance: .init(titleColor: colorProvider.primaryBackground, font: .nitrozen(.body(size: .s, weight: .useDefault))),
				itemSize: .init(width: 96, height: 40),
				itemSpacing: .infinity,
				selectedViewShape: .capsule,
				backgroundPadding: .custom(paddingToAdd: .init(top: 4, leading: 4, bottom: 4, trailing: 4))
			),
            emptyView: emptyViewAppearance(colorProvider: colorProvider)
		)
	}()
	
	private static func textfieldAppearance() -> NitrozenAppearance.TextField {
		.init(
			textFieldInternalTextLabel: .init(titleColor: ColorProvider.shared.gray100, font: .nitrozen(.body(size: .s, weight: .useDefault))),
			topInfo: .init(titleColor: ColorProvider.shared.gray80, font: .nitrozen(.body(size: .s, weight: .useDefault))),
			topInfoPadding: .custom(paddingToAdd: .init(top: 0, leading: 8, bottom: 8, trailing: 0)),
			sucessInfo: .init(titleColor: ColorProvider.shared.success80, font: .nitrozen(.body(size: .xxs, weight: .regular))),
			successInfoPadding: .custom(paddingToAdd: .init(top: 8, leading: 8, bottom: 0, trailing: 0)),
			errorInfo: .init(titleColor: ColorProvider.shared.error80, font: .nitrozen(.body(size: .xxs, weight: .regular))),
			errorInfoPadding: .custom(paddingToAdd: .init(top: 8, leading: 8, bottom: 0, trailing: 0)),
			borderColor: ColorProvider.shared.gray40,
			borderWidth: 1,
			borderPadding: .custom(paddingToAdd: .init(top: 10, leading: 10, bottom: 10, trailing: 10)),
			borderRadius: 16,
			backgroundColor: ColorProvider.shared.primaryBackground
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
	
	private static func stapperAppearance(color: SystemColor, font: SystemFont) -> NitrozenAppearance.PageControl {
		.init(
			selectedColor: color, deselectedColor: .gray,
			selectedSize: .init(width: Double(CGFloat.infinity), height: 10), deSelectedSize: .init(width: Double(CGFloat.infinity), height: 10),
			selectedBorderColor: .clear, deselectedBorderColor: .clear,
			selectedBorderWidth: 2.0, deselectedBorderWidth: 4.0,
			selectedViewShape: .capsule, deselectedViewShape: .capsule,
			spacing: 8
		)
	}
	
	private static func otpTextViewAppearance(colorProvider: ColorProvider) -> NitrozenAppearance.OTPTextView {
		NitrozenAppearance.OTPTextView.init(textStyle: TextLabel.init(titleColor: .black, font: .nitrozen(.body(size: .s, weight: .useDefault))), placeHolderStyle: .init(titleColor: .gray, font: .nitrozen(.body(size: .s, weight: .useDefault))), size: CGSize.init(width: 48, height: 48), borderColor: .gray, borderWidth: 1, borderRadius: 16,fillBorderColor: .black, focusedBorderColor: colorProvider.primary50 ,errorColor: colorProvider.error50, successColor: colorProvider.success50)
	}
    
    private static func avatarViewAppearance(colorProvider: ColorProvider) -> NitrozenAppearance.Avatar {
        NitrozenAppearance.Avatar(
            borderWidth: 0,
            borderColor: .clear,
            backgroundColor: colorProvider.sparkle20,
            textStyle: TextLabel.init(titleColor: colorProvider.sparkle60, font: .nitrozen(.body(size: .l, weight: .useDefault))),
            viewShape: .circle,
            size: CGSize.init(width: 60, height: 60)
        )
    }
    
    private static func emptyViewAppearance(colorProvider: ColorProvider) -> NitrozenAppearance.EmptyView {
        NitrozenAppearance.EmptyView(
            titleStyle: TextLabel.init(titleColor: colorProvider.gray100, font: .nitrozen(.heading(size: .xxs))),
            subTitleStyle: TextLabel.init(titleColor: colorProvider.gray80, font: .nitrozen(.body(size: .s, weight: .useDefault))),
            titlePadding: .custom(paddingToAdd: .init(top: 16, leading: 20, bottom: 0, trailing: 20)),
            subTitlePaddding: .custom(paddingToAdd: .init(top: 4, leading: 20, bottom: 0, trailing: 20)),
            buttonPadding: .custom(paddingToAdd: .init(top: 32, leading: 20, bottom: 20, trailing: 0))
        )
    }
}

//MARK: Copy Support
public extension NitrozenAppearance {
	var copy: NitrozenAppearance {
		return .init(
			colorProvider: self.colorProvider.copy,
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
			tagView: self.tagView.copy,
			pageControl: self.pageControl.copy,
			otpTextView: self.otpTextView.copy,
            toggle: self.toggle.copy,
            stapper: self.stapper.copy,
            avatar: self.avatar.copy,
			divider: self.divider.copy,
			segment: self.segment.copy,
            emptyView: self.emptyView.copy
		)
	}
}
