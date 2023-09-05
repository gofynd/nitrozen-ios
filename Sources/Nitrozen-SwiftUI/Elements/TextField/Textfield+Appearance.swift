//
//  Textfield+Appearance.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 28/03/23.
//

import Foundation
import SwiftUI

public extension NitrozenAppearance {
	//TODO: define protocol textApperancable for titleColor and font
    
    enum CustomImageView {
        case systemImage(name: String) //customized image from SFSymbol
        case assetImage(name: String) //customized image from .xcassets
        case custom(view: AnyView) // whole customized view
    }

    
	class TextField {
		var topInfo: TextLabel
		var sucessInfo: TextLabel
		var errorInfo: TextLabel
		
        var sucessInfoImage: CustomImageView
        var errorInfoImage: CustomImageView

		var textFieldInternalTextLabel: TextLabel
		
		var borderColor: SystemColor
		var borderWidth: CGFloat
		var borderPadding: ViewPadding
		var borderRadius: CGFloat
		
		var topInfoPadding: ViewPadding
		var successInfoPadding: ViewPadding
		var errorInfoPadding: ViewPadding
		
		var backgroundColor: SystemColor
		
		public init(
			textFieldInternalTextLabel: TextLabel,
			topInfo: TextLabel,
            topInfoPadding: ViewPadding,
			sucessInfo: TextLabel,
            sucessInfoImage: CustomImageView,
            successInfoPadding: ViewPadding,
			errorInfo: TextLabel,
            errorInfoPadding: ViewPadding,
            errorInfoImage: CustomImageView,
			borderColor: SystemColor,
			borderWidth: CGFloat,
			borderPadding: ViewPadding,
			borderRadius: CGFloat,
			backgroundColor: SystemColor
		) {
			self.textFieldInternalTextLabel = textFieldInternalTextLabel
			self.borderColor = borderColor
			self.borderWidth = borderWidth
			self.borderPadding = borderPadding
			self.borderRadius = borderRadius
			
			self.topInfo = topInfo
			self.topInfoPadding = topInfoPadding
			
			self.sucessInfo = sucessInfo
            self.sucessInfoImage = sucessInfoImage
			self.successInfoPadding = successInfoPadding
			
			self.errorInfo = errorInfo
            self.errorInfoImage = errorInfoImage
			self.errorInfoPadding = errorInfoPadding
			
			self.backgroundColor = backgroundColor
            
            
		}
	}
}


public extension NitrozenAppearance.TextField {
	@discardableResult
	func textFieldInternalTextLabel(_ textFieldInternalTextLabel: NitrozenAppearance.TextLabel) -> Self { self.textFieldInternalTextLabel = textFieldInternalTextLabel; return self }
	
	@discardableResult
	func topInfo(_ topInfo: NitrozenAppearance.TextLabel) -> Self { self.topInfo = topInfo; return self }
	
	@discardableResult
	func topInfoPadding(_ topInfoPadding: ViewPadding) -> Self { self.topInfoPadding = topInfoPadding; return self }
	
	@discardableResult
	func sucessInfo(_ sucessInfo: NitrozenAppearance.TextLabel) -> Self { self.sucessInfo = sucessInfo; return self }
    
    @discardableResult
    func sucessInfoImage(_ sucessInfoImage: NitrozenAppearance.CustomImageView) -> Self { self.sucessInfoImage = sucessInfoImage; return self }
	
	@discardableResult
	func successInfoPadding(_ successInfoPadding: ViewPadding) -> Self { self.successInfoPadding = successInfoPadding; return self }
	
	@discardableResult
	func errorInfo(_ errorInfo: NitrozenAppearance.TextLabel) -> Self { self.errorInfo = errorInfo; return self }
	
    @discardableResult
    func errorInfoImage(_ errorInfoImage: NitrozenAppearance.CustomImageView) -> Self { self.errorInfoImage = errorInfoImage; return self }

	@discardableResult
	func errorInfoPadding(_ errorInfoPadding: ViewPadding) -> Self { self.errorInfoPadding = errorInfoPadding; return self }
	
	@discardableResult
	func borderColor(_ borderColor: SystemColor) -> Self { self.borderColor = borderColor; return self }
	
	@discardableResult
	func borderWidth(_ borderWidth: CGFloat) -> Self { self.borderWidth = borderWidth; return self }
	
	@discardableResult
	func borderPadding(_ borderPadding: ViewPadding) -> Self { self.borderPadding = borderPadding; return self }
	
	@discardableResult
	func borderRadius(_ borderRadius: CGFloat) -> Self { self.borderRadius = borderRadius; return self }
	
	@discardableResult
	func backgroundColor(_ backgroundColor: SystemColor) -> Self { self.backgroundColor = backgroundColor; return self }
}

//MARK: Copy Support
public extension NitrozenAppearance.TextField {
	var copy: NitrozenAppearance.TextField {
		.init(
			textFieldInternalTextLabel: self.textFieldInternalTextLabel.copy,
			topInfo: self.topInfo.copy, topInfoPadding: self.topInfoPadding,
            sucessInfo: self.sucessInfo.copy, sucessInfoImage: self.sucessInfoImage, successInfoPadding: self.successInfoPadding,
            errorInfo: self.errorInfo.copy, errorInfoPadding: self.errorInfoPadding,
            errorInfoImage: self.errorInfoImage, borderColor: self.borderColor,
            borderWidth: self.borderWidth,
            borderPadding: self.borderPadding,
            borderRadius: self.borderRadius,
            backgroundColor: self.backgroundColor

		)
	}
}
