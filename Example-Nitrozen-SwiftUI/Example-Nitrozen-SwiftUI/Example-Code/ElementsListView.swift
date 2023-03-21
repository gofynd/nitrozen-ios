//
//  ElementsListView.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 28/12/22.
//

import SwiftUI
import Nitrozen_SwiftUI

struct UIElementTextFieldsView: View {
	
	init() {
		self.setupNitrozenAppearance()
	}
	
	func setupNitrozenAppearance(){
		
		let primaryColor = SystemColor.purple
		let font = SystemFont.title
		let disabledButtonOpacity: Double = 0.3
		
		NitrozenAppearance.shared.colorProvider
			.primary(primaryColor)
		
		NitrozenAppearance.shared.primaryButton
			.backgroundColor(primaryColor)
			.backgroundColorDisabled(primaryColor.opacity(disabledButtonOpacity))
			.titleColor(.white)
			.titleColorDisabled(.white.opacity(disabledButtonOpacity))
			.font(font)
			.borderWidth(0.0)
		
		NitrozenAppearance.shared.borderedButton
			.backgroundColor(.clear)
			.backgroundColorDisabled(.clear)
			.titleColor(primaryColor)
			.titleColorDisabled(primaryColor.opacity(disabledButtonOpacity))
			.font(font)
			.borderWidth(1.0)
		
		NitrozenAppearance.shared.tertiaryButton
			.backgroundColor(.clear)
			.backgroundColorDisabled(.clear)
			.titleColor(primaryColor)
			.titleColorDisabled(primaryColor.opacity(disabledButtonOpacity))
			.font(font)
			.borderWidth(0.0)
			
	}
	
	var body: some View {
		List{
			
			Section {
				
				Text("Textfields")
//					.largeTitle(weight: .bold)
				
//				Text("Regular Gray border")
//					.secondaryTitle(weight: .regular)
//				TextField.init("Placeholder...", text: .constant(""))
//					.textFieldStyle(UIElement.TextField.Style.NoFocusedBorder())
//
//				Text("Focus color border / accent color")
//					.secondaryTitle(weight: .regular)
//				TextField.init("Placeholder...", text: .constant(""))
//					.textFieldStyle(UIElement.TextField.Style.FocusedBorder())
//
//
//				Text("out of focus Error color border ")
//					.secondaryTitle(weight: .regular)
//				TextField.init("Placeholder...", text: .constant(""))
//					.textFieldStyle(UIElement.TextField.Style.NoFocusedErrorBorder())
//
//
//				Text("Focus Error color border")
//					.secondaryTitle(weight: .regular)
//				TextField.init("Placeholder...", text: .constant(""))
//					.textFieldStyle(UIElement.TextField.Style.FocusedErrorBorder())
			}
		}
	}
}

struct UIElementsList: View {
	
	var body: some View {
		NavigationStack {
			List {
				NavigationLink {
					Buttons()
				} label: {
					Text("Buttons")
				}
				
				NavigationLink {
					UIElementTextFieldsView()
				} label: {
					Text("Textfields")
				}
				
				NavigationLink {
					TextLabels()
				} label: {
					Text("TextLabels")
				}

			}
			.navigationTitle("Nitrozen Elements")
		}

	}
}

struct UIElementsList_Preview: PreviewProvider {
	static var previews: some View {
		UIElementsList()
			.previewDevice(PreviewDevice.init(stringLiteral: "iPhone 14 Pro"))
	}
}
