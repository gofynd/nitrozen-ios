//
//  Example_Nitrozen_SwiftUIApp.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 17/03/23.
//

import SwiftUI
import Nitrozen_SwiftUI

@main
struct Example_Nitrozen_SwiftUIApp: App {
	
	init() {
		self.setupNitrozenAppearance()
	}
	
	
    var body: some Scene {
        WindowGroup {
			UIElementsList()
        }
    }
	
	func setupNitrozenAppearance(){
		
		let primaryColor = NitrozenAppearance.shared.colorProvider.primary50
		let font: SystemFont = .nitrozen(.body(size: .m, weight: .bold))
		let disabledButtonOpacity: Double = 0.3
		
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
			.titleColor(NitrozenAppearance.shared.colorProvider.primary60)
			.titleColorDisabled(NitrozenAppearance.shared.colorProvider.primary60.opacity(disabledButtonOpacity))
			.font(font)
			.borderWidth(0.0)
		
		NitrozenAppearance.shared.textField
				.errorInfo(.init(titleColor: .red.opacity(0.85), font: .caption))
				.sucessInfo(.init(titleColor: .green.opacity(0.85), font: .caption))
		
		NitrozenAppearance.shared.otpTextView
			.borderRadius(16)
			.size(CGSize.init(width: 48, height: 48))
			.textStyle(NitrozenAppearance.TextLabel.init(titleColor: .black, font: .nitrozen(.body(size: .s, weight: .useDefault))))
	}
}
