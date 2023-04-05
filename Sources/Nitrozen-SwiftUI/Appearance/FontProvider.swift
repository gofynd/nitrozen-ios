//
//  FontProvider.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 15/03/23.
//

import SwiftUI


//TODO: Hitedra- As of now not using this --  remove/archive this file later
public class FontProvider {
	
	//MARK: public properties
	public var headingXS: SystemFont
	public var headingXXS: SystemFont
	
	public var subHeadingS: SystemFont
	public var bodyXS: SystemFont
	public var labelXXS: SystemFont
	
	//MARK: Init
	init(
		headingXS: SystemFont, headingXXS: SystemFont,
		subHeadingS: SystemFont,
		bodyXS: SystemFont,
		labelXXS: SystemFont
	) {
		self.headingXS = headingXS
		self.headingXXS = headingXXS
		self.subHeadingS = subHeadingS
		self.bodyXS = bodyXS
		self.labelXXS = labelXXS
	}
}

public extension FontProvider {
	//MARK: Public Shared
	static var shared: FontProvider = {
		.init(headingXS: .largeTitle.weight(.bold), headingXXS: .title.weight(.bold),
			  subHeadingS: .title.weight(.medium), bodyXS: .body.weight(.regular),
			  labelXXS: .callout.weight(.regular))
	}()
}

//MARK: Property updaters
public extension FontProvider {
	@discardableResult
	func headingXS(_ headingXS: SystemFont) -> Self { self.headingXS = headingXS; return self }
	
	@discardableResult
	func headingXXS(_ headingXXS: SystemFont) -> Self { self.headingXXS = headingXXS; return self }
	
	@discardableResult
	func subHeadingS(_ subHeadingS: SystemFont) -> Self { self.subHeadingS = subHeadingS; return self }
	
	@discardableResult
	func bodyXS(_ bodyXS: SystemFont) -> Self { self.bodyXS = bodyXS; return self }
	
	@discardableResult
	func labelXXS(_ labelXXS: SystemFont) -> Self { self.labelXXS = labelXXS; return self }
}

//MARK: Copy Support
public extension FontProvider {
	var copy: FontProvider {
		FontProvider(
			headingXS: self.headingXS,
			headingXXS: self.headingXXS,
			subHeadingS: self.subHeadingS,
			bodyXS: self.bodyXS,
			labelXXS: self.labelXXS)
	}
}
