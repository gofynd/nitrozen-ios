//
//  ColorProvider.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 15/03/23.
//

import SwiftUI

public class ColorProvider {
	
	//MARK: public properties
	public var primary: SystemColor
	
	//MARK: Init
	init(primary: SystemColor) {
		self.primary = primary
	}
	
	
}

public extension ColorProvider {
	//MARK: Public Shared
	static var shared: ColorProvider = {
		.init(primary: SystemColor.blue)
	}()
}

//MARK: Property updaters
public extension ColorProvider {
	@discardableResult
	func primary(_ primary: SystemColor) -> Self { self.primary = primary; return self }
}

//MARK: Copy Support
public extension ColorProvider {
	var copy: ColorProvider {
		ColorProvider(primary: self.primary)
	}
}
