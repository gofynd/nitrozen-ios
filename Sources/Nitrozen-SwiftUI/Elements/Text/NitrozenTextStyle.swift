//
//  NitrozenTextStyle.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 20/03/23.
//

import SwiftUI

struct NitrozenTextStyle: NitrozenElementStyle, NitrozenElementLoadingStyle {

	let textColor: Color
	let font: Font
	
	var isLoading: Bool
	var loaderSize: NitrozenElementLoaderSize
	
	init(textColor: Color,
		font: Font,
		isLoading: Bool,
		loaderSize: NitrozenElementLoaderSize
	) {
		self.textColor = textColor
		self.font = font
		self.isLoading = isLoading
		self.loaderSize = loaderSize
	}
}

extension View {
	func apply(textStyle: NitrozenTextStyle) -> some View {
		
		@ViewBuilder func textWithStyle() -> some View {
			self
				.font(textStyle.font)
				.foregroundColor(textStyle.textColor)
				.opacity(textStyle.isLoading ? 0.001 : 1)
		}
		
		if textStyle.isLoading {
			return AnyView(GeometryReader { geometryReader in
				
				let size: CGSize = {
					switch textStyle.loaderSize {
					case .defaultSize:
						return CGSize(width: geometryReader.size.width, height: geometryReader.size.height)
					case .custom(let size):
						return size
					}
				}()
				
				ZStack(alignment: .topLeading) {
					textWithStyle()
					if textStyle.isLoading {
						ShimmerView(size: size)
					}
				}
			})
		}
		
		return  AnyView(textWithStyle())
	}
}
