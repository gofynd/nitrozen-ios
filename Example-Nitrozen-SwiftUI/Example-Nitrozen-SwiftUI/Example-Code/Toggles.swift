//
//  Toggles.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 12/04/23.
//

import SwiftUI
import Nitrozen_SwiftUI

struct Toggles: View {
	
	@State var isOn1 = false
	@State var isOn2 = false
	@State var isOn3 = false
	
	var body: some View {
		List{
			Section {
				Text("Default Toggle")
				Toggle("On/Off", isOn: $isOn1)
					.nitrozenToggle()
			}
			
			Section {
				Text("Custom color\n- background color and thumb color and border color")
				
				Toggle("On/Off", isOn: $isOn2)
					.nitrozenToggle(apperance: NitrozenAppearance.shared
						.toggle.copy
						.onState(NitrozenAppearance.shared.toggle
							.onState.copy
							.backgroundColor(.purple.opacity(0.5))
							.borderColor(.purple)
							.borderWidth(1.0)
							.thumbColor(.purple)
								 
						)
						.offState(
							NitrozenAppearance.shared.toggle
								.offState.copy
								.backgroundColor(.black.opacity(0.2))
								.borderColor(.black)
								.thumbColor(.black)
						)
					)
			}
			
			Section {
				Text("Custom color\n- background color and thumb color and border color\n- Custom border width\n- Custom size")
				
				Toggle("On/Off", isOn: $isOn3)
					.nitrozenToggle(apperance: NitrozenAppearance.shared
						.toggle.copy
						.onState(NitrozenAppearance.shared.toggle
							.onState.copy
							.backgroundColor(.orange.opacity(0.5))
							.borderColor(.orange)
							.borderWidth(3)
							.thumbColor(.orange.opacity(0.5))
							.thumbBorderColor(.orange)
							.thumbBorderWidth(4)
								 
						)
						.offState(
							NitrozenAppearance.shared.toggle
								.offState.copy
								.backgroundColor(.black.opacity(0.2))
								.borderColor(.black)
								.thumbColor(.black)
								.borderWidth(3)
								.thumbBorderWidth(4)
						)
						.size(.init(width: 100, height: 50))
						.thumbSize(.init(width: 34, height: 34))
						.thumbPadding(.custom(paddingToAdd: .init(top: 8, leading: 8, bottom: 8, trailing: 8)))
					)
			}
			
		}
	}
}
