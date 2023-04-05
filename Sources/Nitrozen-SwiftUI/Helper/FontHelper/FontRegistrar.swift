//
//  FontRegistrar.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 31/03/23.
//

import UIKit
import CoreGraphics
import CoreText

public struct FontRegistar {
	public enum Error: Swift.Error {
		case registrationFailed
	}
	
	static public func register(name: String, extension: String = "ttf") throws {
		guard let fontURL = Bundle.module.url(forResource: name, withExtension: `extension`),
			  let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
			  let font = CGFont(fontDataProvider),
			  CTFontManagerRegisterGraphicsFont(font, nil)
		else {
			throw Error.registrationFailed
		}
	}
}


internal enum JIOFontNamesProvider {
	internal struct FileName {
		static let regular = "jio_type_regular"
		static let light = "jio_type_light"
		static let medium = "jio_type_medium"
		static let bold = "jio_type_bold"
		static let black = "jio_type_black"
	}
	
	internal struct PostscriptName {
		static let regular = "JioType"
		static let light = "JioType-Light"
		static let medium = "JioType-Medium"
		static let bold = "JioType-Bold"
		static let black = "JioType-Black"
	}
}

extension FontRegistar {
	static func registerJIOFonts(){
		do {
			try FontRegistar.register(name: JIOFontNamesProvider.FileName.regular)
			try FontRegistar.register(name: JIOFontNamesProvider.FileName.light)
			try FontRegistar.register(name: JIOFontNamesProvider.FileName.medium)
			try FontRegistar.register(name: JIOFontNamesProvider.FileName.bold)
			try FontRegistar.register(name: JIOFontNamesProvider.FileName.black)
		} catch {
			let reason = error.localizedDescription
			assertionFailure("Failed to register JIOFonts -- Reason:\(reason)")
		}
	}
}
