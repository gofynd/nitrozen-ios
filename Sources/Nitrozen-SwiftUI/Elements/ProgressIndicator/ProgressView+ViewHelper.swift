//
//  ProgressView+ViewHelper.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 10/05/23.
//

import Foundation
import SwiftUI

//MARK: Text Helper -> Public APIs
@available(iOS 14.0, *)
public extension ProgressView {
	func nitrozenProgress(apperance: NitrozenAppearance.ProgressView? = nil) -> some View {
		let style = nitrozenProgressStyle(forAppearance: apperance.or(NitrozenAppearance.shared.progressView))
		return self.progressViewStyle(style)
	}
}

@available(iOS 14.0, *)
fileprivate extension View {
	func nitrozenProgressStyle(forAppearance: NitrozenAppearance.ProgressView) -> NitrozenProgressStyle {
		return .init(appearance: forAppearance)
	}
}
