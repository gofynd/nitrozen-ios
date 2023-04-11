//
//  NitrozenFont.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 31/03/23.
//

import Foundation
import SwiftUI


extension Font {
   /// Returns a Scaled-size font of the specified style.
   /// Device dependent based on accesibility settings
   internal static func scaledFont(_ name: String, size: CGFloat) -> Font {
	   let scaledSize = UIFontMetrics.default.scaledValue(for: size)
	   return Font.custom(name, size: scaledSize)
   }
   
   public static func nitrozen(_ style: NitrozenFont.Style) -> Font {
	   return NitrozenFont(style).systemFont
   }
}

public struct NitrozenFont {
	
	public enum Style {
		case heading(size: Size) //always black weight
		case overline
		case body(size: Size, weight: Weight)
		case listTitle, button
	}
	
	public enum Size {
		case xl, l, m, s, xs, xxs
	}
	
	public enum Weight {
		case useDefault, regular, bold, link
	}
	
	var style: Style
	init(_ style: Style) {
		self.style = style
	}
	
	var systemFont: SystemFont {
		
		switch style {
			
			/// Heading
		case .heading(let size):
			let pointSize: CGFloat = {
				switch size {
				case .xl: return 64
				case .l: return 48
				case .m: return 40
				case .s: return 32
				case .xs: return 24
				case .xxs: return 16
				}
			}()
			return Font.scaledFont(JIOFontNamesProvider.PostscriptName.black, size: pointSize)
			
			/// Overline
		case .overline:
			return Font.scaledFont(JIOFontNamesProvider.PostscriptName.bold, size: 14)
			
			/// Body
		case .body(let size, let weight):
			let pointSize: CGFloat = {
				switch size {
				case .xl: assertionFailure("NitrozenStyle: XL not possible with Body"); return 24
				case .l: return 24
				case .m: return 18
				case .s: return 16
				case .xs: return 14
				case .xxs: return 12
				}
			}()
			
			let fontName: String = {
				switch weight {
				case .useDefault:
					return JIOFontNamesProvider.PostscriptName.medium
				case .regular:
					return JIOFontNamesProvider.PostscriptName.regular
				case .bold:
					return JIOFontNamesProvider.PostscriptName.bold
				case .link: //link is always bold with body
					return JIOFontNamesProvider.PostscriptName.bold
				}
			}()
			
			return Font.scaledFont(fontName, size: pointSize)
			
			/// ListTitle
		case .listTitle:
			return Font.scaledFont(JIOFontNamesProvider.PostscriptName.medium, size: 16)
			
			/// Button
		case .button:
			return Font.scaledFont(JIOFontNamesProvider.PostscriptName.bold, size: 16)
		}
	}
}
