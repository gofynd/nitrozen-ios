//
//  View+Conditional.swift
//  
//
//  Created by Hitendra Solanki on 17/03/23.
//

import SwiftUI

extension View {
	/// Applies the given transform if the given condition evaluates to `true`.
	/// - Parameters:
	///   - condition: The condition to evaluate.
	///   - contentTransformer: The transform to apply to the source `View`.
	/// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
	@ViewBuilder func `if`<Content: View>(_ condition: Bool, contentTransformer: (Self) -> Content) -> some View {
		if condition {
			contentTransformer(self)
		} else {
			self
		}
	}
}
