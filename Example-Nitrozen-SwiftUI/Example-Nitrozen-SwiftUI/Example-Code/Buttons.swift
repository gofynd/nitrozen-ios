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
//				.largeTitle(weight: .bold)
			
			VStack {
				Text("Enabled Button")
//					.secondaryTitle(weight: .regular)
				Button(action: {}) {
					Text("Click me")
						.frame(maxWidth: .infinity)
				}
				.primaryButton()
			}
			
			VStack{
				Text("Disabled Button")
//					.secondaryTitle(weight: .regular)
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
					//						.secondaryTitle(weight: .regular)
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
					//						.secondaryTitle(weight: .regular)
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
			//				.secondaryTitle(weight: .regular)
			Button(action: {}) {
				Text("Click me")
					.frame(maxWidth: .infinity)
			}
			.primaryButton()
			
			
			VStack{
				Text("Width and Height = dynamic, depends on title")
				//					.secondaryTitle(weight: .regular)
				
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
			//				.secondaryTitle(weight: .regular)
			
			Button(action: {}) {
				Text("Click me")
					.frame(width: 150, height: 60)
			}
			.primaryButton()
		}
		
		Section {
			
			Text("Image and Title Buttons ")
//				.largeTitle(weight: .bold)
			
			Text("With image")
//				.secondaryTitle(weight: .regular)
			Button(action: {}) {
				HStack{
					Image(systemName: "paperplane.fill")
					Text("Click me")
				}
			}
			.primaryButton()
			
			Text("Disable with image")
//				.secondaryTitle(weight: .regular)
			Button(action: {}) {
				HStack{
					Image(systemName: "paperplane.fill")
					Text("Click me")
				}
			}
			.disabled(true)
			.primaryButton()
			
			Text("With only image")
//				.secondaryTitle(weight: .regular)
			Button(action: {}) {
				Image(systemName: "paperplane.fill")
			}
			.primaryButton(shape: .circle)
		}
	}
	
	@ViewBuilder func borderedButtons() -> some View {
		Section {
			Text("Bordered Buttons")
//				.largeTitle(weight: .bold)
			
			
			Text("Enabled Button")
//				.secondaryTitle(weight: .regular)
			Button(action: {}) {
				Text("Click me")
			}
			.borderedButton()
			
			
			Text("Disabled Button")
//				.secondaryTitle(weight: .regular)
			Button(action: {}) {
				Text("Click me")
			}
			.disabled(true)
			.borderedButton()
		}
	}
	
	@ViewBuilder func tintButtons() -> some View {
		Section {
			
			Text("Tertiary Buttons")
//				.largeTitle(weight: .bold)
			
			HStack {
				Text("Enabled Button")
//					.secondaryTitle(weight: .regular)
				Spacer()
				Button(action: {}) {
					Text("Click me")
				}
				.tertiaryButton()
			}
			
			HStack {
				Text("Disabled Button")
//					.secondaryTitle(weight: .regular)
				Spacer()
				Button(action: {}) {
					Text("Click me")
				}
				.disabled(true)
				.tertiaryButton()
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
