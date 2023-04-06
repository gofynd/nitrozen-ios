//
//  NitrozenTextField.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 28/03/23.
//

import SwiftUI
import FloatingTextField_SwiftUI

public struct NitrozenTextField: View {
	
	public struct Info {
		public enum Position: Hashable {  case top, error, success }
		
		var position: Position
		var text: String
		var canShow: Bool
		
		var appearance: NitrozenAppearance.TextLabel?
		
		public init(position: Position, text: String, canShow: Bool = true, appearance: NitrozenAppearance.TextLabel? = nil) {
			self.position = position
			self.text = text
			self.canShow = canShow
			self.appearance = appearance
		}
	}
	
	var isSecure: Bool = false
	
	var binding: Binding<String>
	
	var placeHolder: String
	var infos: [Info] = []
	
	var borderedAppearance: FloatingTextField_SwiftUI.Modifiers.Rounded.Configuration
	var textFieldAppearance: FloatingTextField_SwiftUI.Modifiers.Floating.Configuration
	
	var leftView: AnyView? = nil
	var rightView: AnyView? = nil
	
	public init(
		binding: Binding<String>, placeHolder: String,
		infos: [Info],
		isSecure: Bool = false,
		borderedAppearance: FloatingTextField_SwiftUI.Modifiers.Rounded.Configuration? = nil,
		textFieldAppearance: FloatingTextField_SwiftUI.Modifiers.Floating.Configuration? = nil,
		leftView: AnyView? = nil, rightView: AnyView? = nil
	) {
		self.isSecure = isSecure
		self.binding = binding
		self.placeHolder = placeHolder
		self.infos = infos
		self.leftView = leftView
		self.rightView = rightView
		self.borderedAppearance = borderedAppearance.or(NitrozenAppearance.shared.textField.borderAppearance)
		self.textFieldAppearance = textFieldAppearance.or(
			.init()
				.textFieldFont(NitrozenAppearance.shared.textField.font)
				.textFieldColor(NitrozenAppearance.shared.textField.titleColor)
				.allowsFloatingPlaceholder(false)
				.leftView(AnyView(self.leftView.convertToView{ $0 }))
				.rightView(AnyView(self.rightView.convertToView{ $0 }))
		)
	}
	
	public var body: some View {
		VStack(spacing: 4) {
			infoView()
				.frame(maxWidth: .infinity, alignment: .leading)
			textField()
				
			errorView()
				.frame(maxWidth: .infinity, alignment: .leading)
			successView()
				.frame(maxWidth: .infinity, alignment: .leading)
		}
	}
	
	
	@ViewBuilder
	func textField() -> some View {
		Group {
			if self.isSecure {
				SecureField(placeHolder, text: binding)
			} else {
				TextField(placeHolder, text: binding)
			}
		}
		.floatingRounded(self.borderedAppearance)
		.floating(self.textFieldAppearance)
	}
	
	@ViewBuilder
	func infoView() -> some View {
		self.infos.filter { $0.position == .top }
			.first.convertToView { info in
				if info.canShow {
					HStack {
						Spacer().frame(width: 6)
						Text(info.text)
							.foregroundColor(info.appearance.or(NitrozenAppearance.shared.textField.topInfo).titleColor)
							.font(info.appearance.or(NitrozenAppearance.shared.textField.topInfo).font)
						
					}
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
				}
		}
	}
}
