//
//  Toggle+ViewHelper.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 12/04/23.
//

import Foundation
import SwiftUI

//MARK: Text Helper -> Public APIs
public extension Toggle {
	func nitrozenToggle(apperance: NitrozenAppearance.Toggle? = nil) -> some View {
		let style = nitrozenTogglelStyle(forAppearance: apperance.or(NitrozenAppearance.shared.toggle))
		return self.toggleStyle(style)
	}
}

fileprivate extension View {
	func nitrozenTogglelStyle(forAppearance: NitrozenAppearance.Toggle) -> NitrozenToggleStyle {
		return .init(appearance: forAppearance)
	}
}
