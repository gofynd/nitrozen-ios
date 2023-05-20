//
//  NitrozenDropdownTextField.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 29/03/23.
//

import SwiftUI

public struct NitrozenDropdownTextField: View {
	
	var binding: Binding<String>
	
	var placeHolder: String
	var infos: [NitrozenTextField.Info] = []
	
	var leftView: AnyView? = nil
	var rightView: AnyView? = nil
	
	var onTap: ElementTap
	
	public init(
		binding: Binding<String>, placeHolder: String,
		infos: [NitrozenTextField.Info],
		onTap: @escaping ElementTap,
		leftView: AnyView? = nil, rightView: AnyView? = nil
	) {
		self.binding = binding
		self.placeHolder = placeHolder
		self.infos = infos
		self.leftView = leftView
		self.rightView = rightView
		self.onTap = onTap
	}
	
	public var body: some View {
		VStack(spacing: 0) {
			self.textFieldContainer.infoView()
			
			ZStack {
				self.textFieldContainer.textField()
					.disabled(true)
					.contentShape(Rectangle()) //for user interaction in all the area
					.onTapGesture {
						self.onTap()
					}
			}
			self.textFieldContainer.errorView()
			self.textFieldContainer.successView()
		}
	}
	
	@ViewBuilder
	func dropDownIconView() -> AnyView {
		AnyView(
			Image(systemName: "chevron.down")
		)
	}
	
	var textFieldContainer: NitrozenTextField {
		NitrozenTextField(
			binding: self.binding, placeHolder: self.placeHolder, infos: self.infos,
			isSecure: false,
			leftView: self.leftView,
			rightView: self.rightView.or(dropDownIconView()))
	}
}
