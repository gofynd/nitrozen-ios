//
//  Buttons.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 17/03/23.
//

import SwiftUI
import Nitrozen_SwiftUI

struct Buttons: View {
	
	enum ButtonUseCase { case primary, bordered, tertiary }
	
	@State var isButtonEnabled: Bool = false
	@State var isButtonLoading: Bool = false
	
	@ViewBuilder func primaryButtons() -> some View {
		Section {
				
			Text("Primary Buttons")
			
			VStack {
				Text("Enabled Button")
				Button(action: {}) {
					Text("Click me")
						.frame(maxWidth: .infinity)
				}
				.primaryButton()
			}
			
			VStack{
				Text("Disabled Button")
				Button(action: {}) {
					Text("Click me")
						.frame(maxWidth: .infinity)
				}
				.disabled(true)
				.primaryButton()
			}
		}
		
		Section {
			Text("Toggle State")
			VStack {
				HStack{
					Text("Enable/Disable")
					Toggle("", isOn: $isButtonEnabled)
				}
				
				Button(action: {}) {
					Text("Click me")
						.frame(maxWidth: .infinity)
				}
				.disabled(isButtonEnabled)
				.primaryButton()
				
			}
			
			
			VStack {
				HStack{
					Text("Loading")
					Toggle("", isOn: $isButtonLoading)
				}
				
				Button(action: {}) {
					Text("Click me")
						.frame(maxWidth: .infinity)
				}
				.primaryButton(isLoading: $isButtonLoading)
				
			}
			
		}
		
		Section {
			Text("Dynamic and Fix sizes")
			
			Text("Width  max = .infinity")
			Button(action: {}) {
				Text("Click me")
					.frame(maxWidth: .infinity)
			}
			.primaryButton()
			
			
			VStack{
				Text("Width and Height = dynamic, depends on title")
				
				Button(action: {}) {
					Text("M Tap Tap Tap W")
				}
				.primaryButton()
				
				Button(action: {}) {
					Text("Click me, this is long title content button, Click me, ")
						.padding(.horizontal)
						.padding(.horizontal)
				}
				.primaryButton()
			}
			
			Text("Fix height = 60, width = 150")
			
			Button(action: {}) {
				Text("Click me")
					.frame(width: 150, height: 60)
			}
			.primaryButton()
		}
		
		Section {
			
			Text("Image and Title Buttons ")
			
			Text("With image")
			Button(action: {}) {
				HStack{
					Image(systemName: "paperplane.fill")
					Text("Click me")
				}
			}
			.primaryButton()
			
			Text("Disable with image")
			Button(action: {}) {
				HStack{
					Image(systemName: "paperplane.fill")
					Text("Click me")
				}
			}
			.disabled(true)
			.primaryButton()
			
			Text("With only image")
			Button(action: {}) {
				Image(systemName: "paperplane.fill")
			}
			.primaryButton(shape: .circle)
		}
			
		Section {
			
			Text("Custom appearance")

			
			VStack {
				Text("Custom font")
				
				Button(action: {}) {
					HStack{
						Text("Custom font")
					}
				}
				.primaryButton(
					appearance: NitrozenAppearance.shared
						.primaryButton.copy
						.font(.system(size: 10).italic())
				)
			}
			
			VStack {
				Text("Custom font and color")
				
				Button(action: {}) {
					HStack{
						Text("Custom font")
					}
				}
				.primaryButton(
					appearance: NitrozenAppearance.shared
						.primaryButton.copy
						.font(.system(size: 10).italic())
						.titleColor(.white)
						.backgroundColor(.black)
				)
			}
			
			VStack {
				Text("Custom padding, font, color")
				
				Button(action: {}) {
					HStack{
						Text("Custom font")
					}
				}
				.primaryButton(
					appearance: NitrozenAppearance.shared
						.primaryButton.copy
						.font(.system(size: 10).italic())
						.titleColor(.white)
						.backgroundColor(.black),
					viewPadding: .custom(paddingToAdd: .init(top: 20, leading: 80, bottom: 20, trailing: 80))
				)
			}
		}
	}
	
	@ViewBuilder func borderedButtons() -> some View {
		Section {
			Text("Bordered Buttons")
			
			Text("Enabled Button")
			Button(action: {}) {
				Text("Click me")
			}
			.borderedButton()
			
			
			Text("Disabled Button")
			Button(action: {}) {
				Text("Click me")
			}
			.disabled(true)
			.borderedButton()
		}
		
		Section {
	
			Text("Custom appearance")
			
			HStack {
				Text("Custom font, border color, border width")
				
				Spacer()
				Button(action: {}) {
					HStack{
						Text("Click me")
					}
				}
				.borderedButton(
					appearance: NitrozenAppearance.shared
						.borderedButton.copy
						.font(.nitrozen(.body(size: .l, weight: .bold)))
						.borderColor(.purple)
						.borderWidth(4)
				)
			}
			
			HStack {
				Text("Custom font")
				
				Spacer()
				Button(action: {}) {
					HStack{
						Text("Click me")
					}
				}
				.borderedButton(
					appearance: NitrozenAppearance.shared
						.borderedButton.copy
						.font(.system(size: 10).italic())
				)
			}
			
			HStack {
				Text("Custom font and color")
				
				Spacer()
				Button(action: {}) {
					HStack{
						Text("Custom font")
					}
				}
				.borderedButton(
					appearance: NitrozenAppearance.shared
						.borderedButton.copy
						.font(.system(size: 10).italic())
						.titleColor(.blue)
				)
			}

			
			HStack {
				Text("Custom padding, font, color")
				
				Spacer()
				Button(action: {}) {
					HStack{
						Text("Custom font")
					}
				}
				.borderedButton(
					appearance: NitrozenAppearance.shared
						.borderedButton.copy
						.font(.system(size: 10).italic())
						.titleColor(.purple),
					viewPadding: .custom(paddingToAdd: .init(top: 20, leading: 40, bottom: 20, trailing: 40))
				)
			}
		}
	}
	
	@ViewBuilder func tintButtons() -> some View {
		Section {
			
			Text("Tertiary Buttons")
			
			HStack {
				Text("Enabled Button")
				
				Spacer()
				Button(action: {}) {
					Text("Click me")
				}
				.tertiaryButton()
			}
			
			HStack {
				Text("Disabled Button")
				
				Spacer()
				Button(action: {}) {
					Text("Click me")
				}
				.disabled(true)
				.tertiaryButton()
			}
		}
		
		Section {
			
			Text("Custom appearance")
			
			HStack {
				Text("Custom font")
				
				Spacer()
				Button(action: {}) {
					HStack{
						Text("Click me")
					}
				}
				.tertiaryButton(
					appearance: NitrozenAppearance.shared
						.tertiaryButton.copy
						.font(.system(size: 10).italic())
				)
			}
			
			HStack {
				Text("Custom font and color")
				
				Spacer()
				Button(action: {}) {
					HStack{
						Text("Custom font")
					}
				}
				.tertiaryButton(
					appearance: NitrozenAppearance.shared
						.tertiaryButton.copy
						.font(.system(size: 10).italic())
						.titleColor(.blue)
				)
			}
		}
	}
	
	var body: some View {
		
		TabView {
			List {
				primaryButtons()
			}
			.tabItem {
				Label("Primary", systemImage: "rectangle.fill")
			}
			
			List {
				borderedButtons()
			}
			.tabItem {
				Label("Bordered", systemImage: "character.textbox")
			}
			
			List {
				tintButtons()
			}
			.tabItem {
				Label("Tint", systemImage: "textformat.abc")
			}
			
		}
		
		
	}
}
