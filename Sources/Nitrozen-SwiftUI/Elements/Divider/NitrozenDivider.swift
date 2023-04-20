//
//  NitrozenDivider.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 17/04/23.
//

import SwiftUI

//MARK: PageControlView
public struct NitrozenDivider: View {
	
	var appearance: NitrozenAppearance.Divider
	
	public init(
		appearance: NitrozenAppearance.Divider? = nil
	) {
		self.appearance = appearance.or(NitrozenAppearance.shared.divider)
	}
	
	public var body: some View {
		divider()
	}
	
	@ViewBuilder func divider() -> some View {
		
		Rectangle()
			.fill(self.appearance.color)
			.apply(shape: self.appearance.shape, color: .clear, lineWidth: 0)
			.if(true, contentTransformer: { view -> AnyView in
				
				switch self.appearance.layout {
				case .verticle(let width):
					return AnyView(
						view.frame(width: width)
							.frame(maxHeight: .infinity)
					)
					
				case .horizontal(let height):
					return AnyView(
						view.frame(height: height)
							.frame(maxWidth: .infinity)
					)
					
				case .custom(let size):
					return AnyView(
						view.frame(width: size.width)
							.frame(height: size.height)
					)
				}
				
			})
	}
}
