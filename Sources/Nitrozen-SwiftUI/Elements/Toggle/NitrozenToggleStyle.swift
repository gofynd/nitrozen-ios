//
//  NitrozenToggleStyle.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 12/04/23.
//

import SwiftUI

public struct NitrozenToggleStyle: ToggleStyle {
	
	var appearance: NitrozenAppearance.Toggle
	
	public init(appearance: NitrozenAppearance.Toggle? = nil) {
		self.appearance = appearance.or(NitrozenAppearance.shared.toggle)
	}
	
	
	func currentState(configuration: Configuration) -> NitrozenAppearance.Toggle.State {
		configuration.isOn ? appearance.onState : appearance.offState
	}
	
	public func makeBody(configuration: Configuration) -> some View {
		HStack {
			configuration.label
			Spacer()
			
			ZStack(alignment: .leading) {
				Rectangle()
					.fill(currentState(configuration: configuration).backgroundColor)
					.nitrozen.capsuleWithBorder(color: currentState(configuration: configuration).borderColor, lineWidth: currentState(configuration: configuration).borderWidth)
				
				HStack {
					Spacer()
						.if(configuration.isOn, contentTransformer: { view in
							view
							.frame(maxWidth: .infinity)
						})
							.if(configuration.isOn.isFalse) { view in
							view.frame(width: 0)
						}
							
					Rectangle()
						.fill(currentState(configuration: configuration).thumbColor)
						.nitrozen.circleWithBorder(color:  currentState(configuration: configuration).thumbBorderColor, lineWidth: currentState(configuration: configuration).thumbBorderWidth)
						.frame(width: appearance.thumbSize.width, height: appearance.thumbSize.height)
						.apply(padding: appearance.thumbPadding)
				}
			}
			.frame(width: appearance.size.width, height: appearance.size.height)
			.animation(.easeInOut(duration: 0.16))
			.onTapGesture { configuration.isOn.toggle() }
		}
	}
}
