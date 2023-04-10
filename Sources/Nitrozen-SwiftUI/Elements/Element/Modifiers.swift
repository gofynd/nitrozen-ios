//
//  File.swift
//  
//
//  Created by Hitendra Solanki on 20/03/23.
//

import SwiftUI

enum Modifiers {
	enum Element {}
	enum Button {}
}

extension Modifiers.Element {
	public struct Loading: ViewModifier {
		@Binding var isLoading: Bool
		var elementStyle: NitrozenElementLoadingStyle
		
		var conditionalLoadingStyle: NitrozenElementLoadingStyle {
			var loadingStyle = self.elementStyle
			return loadingStyle.isLoading(isLoading)
		}
		
		init(isLoading: Binding<Bool>, elementStyle: NitrozenElementLoadingStyle) {
			self._isLoading = isLoading
			self.elementStyle = elementStyle
		}
		
		@ViewBuilder
		public func body(content: Content) -> some View {
			content
				.apply(elementStyle: conditionalLoadingStyle)
		}
	}
}


extension View {
	func loading(isLoading: Binding<Bool>, style: NitrozenElementLoadingStyle) -> some View {
		self.modifier(Modifiers.Element.Loading(isLoading: isLoading, elementStyle: style))
	}
}
