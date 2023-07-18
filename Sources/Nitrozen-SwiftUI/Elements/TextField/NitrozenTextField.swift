//
//  NitrozenTextField.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 28/03/23.
//

import SwiftUI

public struct NitrozenTextField: View {
	
	public struct Info {
		
		public enum ToolTipView {
			case notShow
			case nitrozen //default view
			case systemImage(name: String) //customized image from SFSymbol
			case assetImage(name: String) //customized image from .xcassets
		}
		
		public enum Position: Hashable {  case top, error, success }
		
		var position: Position
		var text: String
		var canShow: Bool
		var toolTipIcon:ToolTipView?
		var onTapToolTip: ElementTap?
		var appearance: NitrozenAppearance.TextLabel?
		
		public init(position: Position, text: String, canShow: Bool = true, appearance: NitrozenAppearance.TextLabel? = nil) {
			self.position = position
			self.text = text
			self.canShow = canShow
			self.appearance = appearance
			self.toolTipIcon = .notShow
			
		}
		
		public init(
			position: Position,
			text: String,
			canShow: Bool = true,
			appearance: NitrozenAppearance.TextLabel? = nil,
			toolTipIcon:ToolTipView,
			onTapToolTip: @escaping ElementTap) {
				
			self.position = position
			self.text = text
			self.canShow = canShow
			self.toolTipIcon = toolTipIcon
			self.appearance = appearance
			self.onTapToolTip = onTapToolTip
		}

	}
	
	var isSecure: Bool = false
	
	var binding: Binding<String>
	
	var placeHolder: String
	var infos: [Info] = []
	
	var apperance: NitrozenAppearance.TextField
	
	var leftView: AnyView? = nil
	var rightView: AnyView? = nil
	
	public init(
		binding: Binding<String>, placeHolder: String,
		infos: [Info],
		isSecure: Bool = false,
		apperance: NitrozenAppearance.TextField? = nil,
		leftView: AnyView? = nil, rightView: AnyView? = nil
	) {
		self.isSecure = isSecure
		self.binding = binding
		self.placeHolder = placeHolder
		self.infos = infos
		self.leftView = leftView
		self.rightView = rightView
		self.apperance = apperance.or(NitrozenAppearance.shared.textField)
			
//			.init()
//				.textFieldFont(NitrozenAppearance.shared.textField.font)
//				.textFieldColor(NitrozenAppearance.shared.textField.titleColor)
//				.allowsFloatingPlaceholder(false)
//				.leftView(AnyView(self.leftView.convertToView{ $0 }))
//				.rightView(AnyView(self.rightView.convertToView{ $0 }))
		
	}
	
	public var body: some View {
		VStack(spacing: 0) {
			infoView()
			textField()
			errorView()
			successView()
		}
	}
	
	
	@ViewBuilder
	func textField() -> some View {
		HStack {
			leftView.convertToView { $0 }
			Group {
				if self.isSecure {
					SecureField(placeHolder, text: binding)
				} else {
					TextField(placeHolder, text: binding)
				}
			}
			rightView.convertToView { $0 }
		}
		.apply(padding: self.apperance.borderPadding)
		.foregroundColor(self.apperance.textFieldInternalTextLabel.titleColor)
		.font(self.apperance.textFieldInternalTextLabel.font)
		.background(self.apperance.backgroundColor)
		.nitrozen.roundedCornerWithBorder(color: getBorderColor(), radius: self.apperance.borderRadius, lineWidth: self.apperance.borderWidth)
	}
    
    func getBorderColor() -> Color {
        if self.infos.contains(where: {$0.position == .success }) {
            return Color(self.apperance.sucessInfo.titleColor.uiColor().lighter(percentage: 30))
        } else if self.infos.contains(where: {$0.position == .error }) {
            return Color(self.apperance.errorInfo.titleColor.uiColor().lighter(percentage: 30))
        } else {
            return self.apperance.borderColor
        }
    }
	
	@ViewBuilder
	func infoView() -> some View {
		self.infos.filter { $0.position == .top }
			.first.convertToView { info in
				if info.canShow {
					HStack {
						Spacer().frame(width: 6)
						
						HStack{
							Text(info.text)
								.foregroundColor(info.appearance.or(NitrozenAppearance.shared.textField.topInfo).titleColor)
								.font(info.appearance.or(NitrozenAppearance.shared.textField.topInfo).font)

							Button {
								info.onTapToolTip.or {
									
								}()
								
							} label: {
								switch info.toolTipIcon {
								case .notShow:
									EmptyView()
								case .systemImage(let imageName):
									Image(systemName: imageName)
								case .assetImage(let imageName):
									Image(imageName)
								case .nitrozen:
									Image("ic_toolTip")
								case .none:
									Image("ic_toolTip")
								}

							}

						}
						
						
					}
					.frame(maxWidth: .infinity, alignment: .leading)
					.apply(padding: self.apperance.topInfoPadding)
				}
			}
	}
	
	@ViewBuilder
	func errorView() -> some View {
		self.infos.filter { $0.position == .error }
			.first.convertToView { info in
				if info.canShow {
					HStack {
						Spacer().frame(width: 6)
						Text(info.text)
							.foregroundColor(info.appearance.or(NitrozenAppearance.shared.textField.errorInfo).titleColor)
							.font(info.appearance.or(NitrozenAppearance.shared.textField.errorInfo).font)
					}
					.frame(maxWidth: .infinity, alignment: .leading)
					.apply(padding: self.apperance.errorInfoPadding)
				}
		}
	}
	
	@ViewBuilder
	func successView() -> some View {
		self.infos.filter { $0.position == .success }
			.first.convertToView { info in
				if info.canShow {
					HStack {
						Spacer().frame(width: 6)
						Text(info.text)
							.foregroundColor(info.appearance.or(NitrozenAppearance.shared.textField.sucessInfo).titleColor)
							.font(info.appearance.or(NitrozenAppearance.shared.textField.sucessInfo).font)
						
					}
					.frame(maxWidth: .infinity, alignment: .leading)
					.apply(padding: self.apperance.successInfoPadding)
				}
		}
	}
}
