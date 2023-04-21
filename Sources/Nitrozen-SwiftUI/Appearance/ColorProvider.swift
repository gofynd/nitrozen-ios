//
//  ColorProvider.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 15/03/23.
//

import SwiftUI

extension UIColor {
	// Add value to component ensuring the result is
	// between 0 and 1
	private func add(_ value: CGFloat, toComponent: CGFloat) -> CGFloat {
		return max(0, min(1, toComponent + value))
	}
	
	private func makeColor(componentDelta: CGFloat) -> UIColor {
		var red: CGFloat = 0
		var blue: CGFloat = 0
		var green: CGFloat = 0
		var alpha: CGFloat = 0
		
		// Extract r,g,b,a components from the
		// current UIColor
		getRed(
			&red,
			green: &green,
			blue: &blue,
			alpha: &alpha
		)
		
		// Create a new UIColor modifying each component
		// by componentDelta, making the new UIColor either
		// lighter or darker.
		return UIColor(
			red: add(componentDelta, toComponent: red),
			green: add(componentDelta, toComponent: green),
			blue: add(componentDelta, toComponent: blue),
			alpha: alpha
		)
	}
	
	func lighter(componentDelta: CGFloat) -> UIColor {
		return makeColor(componentDelta: componentDelta)
	}
	
	func darker(componentDelta: CGFloat) -> UIColor {
		return makeColor(componentDelta: -1*componentDelta)
	}
}


extension UIColor {


	func lighter(percentage: CGFloat) -> UIColor {
		return self.lighter(componentDelta: percentage/100)
	}

	func darker(percentage: CGFloat) -> UIColor {
		return self.darker(componentDelta: percentage/100)
	}
}

public class ColorProvider {
	
	//MARK: public properties
	public var primary50: SystemColor
	public var primaryInverse: SystemColor
	
	public var secondary50: SystemColor
	public var secondaryInverse: SystemColor
	
	public var sparkle50: SystemColor
	public var sparkleInverse: SystemColor
	
	public var gray100: SystemColor
	public var error50: SystemColor
	public var success50: SystemColor
	public var warning50: SystemColor
	public var primaryBackground: SystemColor
	public var pageBackground: SystemColor
	
	
	//MARK: Init
	public init(primary50: SystemColor, primaryInverse: SystemColor,
		 secondary50: SystemColor, secondaryInverse: SystemColor,
		 sparkle50: SystemColor, sparkleInverse: SystemColor,
		 
		 gray100: SystemColor,
		 
		 error50: SystemColor, success50: SystemColor, warning50: SystemColor,
		 
		 primaryBackground: SystemColor, pageBackground: SystemColor
	) {
		self.primary50 = primary50
		self.primaryInverse = primaryInverse
		self.secondary50 = secondary50
		self.secondaryInverse = secondaryInverse
		self.sparkle50 = sparkle50
		self.sparkleInverse = sparkleInverse
		self.gray100 = gray100
		self.error50 = error50
		self.success50 = success50
		self.warning50 = warning50
		self.primaryBackground = primaryBackground
		self.pageBackground = pageBackground
	}
	
	public var primary80:  SystemColor { Color(self.primary50.uiColor().darker(percentage: 30)) }
	public var primary70:  SystemColor { Color(self.primary50.uiColor().darker(percentage: 20)) }
	public var primary60:  SystemColor { Color(self.primary50.uiColor().darker(percentage: 10)) }
	//var primary50:  SystemColor
	public var primary40:  SystemColor { Color(self.primary50.uiColor().lighter(percentage: 10)) }
	public var primary30:  SystemColor { Color(self.primary50.uiColor().lighter(percentage: 20)) }
	public var primary20:  SystemColor { Color(self.primary50.uiColor().lighter(percentage: 30)) }
	
	public var sparkle80:  SystemColor { Color(self.sparkle50.uiColor().darker(percentage: 30)) }
	public var sparkle70:  SystemColor { Color(self.sparkle50.uiColor().darker(percentage: 20)) }
	public var sparkle60:  SystemColor { Color(self.sparkle50.uiColor().darker(percentage: 10)) }
	//var sparkle50:  SystemColor
	public var sparkle40:  SystemColor { Color(self.sparkle50.uiColor().lighter(percentage: 10)) }
	public var sparkle30:  SystemColor { Color(self.sparkle50.uiColor().lighter(percentage: 20)) }
	public var sparkle20:  SystemColor { Color(self.sparkle50.uiColor().lighter(percentage: 30)) }
	
	public var secondary80:  SystemColor { Color(self.secondary50.uiColor().darker(percentage: 30)) }
	public var secondary70:  SystemColor { Color(self.secondary50.uiColor().darker(percentage: 20)) }
	public var secondary60:  SystemColor { Color(self.secondary50.uiColor().darker(percentage: 10)) }
	//var secondary50:  SystemColor
	public var secondary40:  SystemColor { Color(self.secondary50.uiColor().lighter(percentage: 10)) }
	public var secondary30:  SystemColor { Color(self.secondary50.uiColor().lighter(percentage: 20)) }
	public var secondary20:  SystemColor { Color(self.secondary50.uiColor().lighter(percentage: 30)) }
	
	//var gray100: SystemColor
	public var gray80:  SystemColor { Color(self.gray100.uiColor().lighter(percentage: 20)) }
	public var gray60:  SystemColor { Color(self.gray100.uiColor().lighter(percentage: 40)) }
	public var gray40:  SystemColor { Color(self.gray100.uiColor().lighter(percentage: 60)) }
	public var gray20:  SystemColor { Color(self.gray100.uiColor().lighter(percentage: 80)) }
	
	public var error80:  SystemColor { Color(self.error50.uiColor().darker(percentage: 30)) }
	//public var error50: SystemColor
	public var error20:  SystemColor { Color(self.error50.uiColor().lighter(percentage: 30)) }
	
	public var success80:  SystemColor { Color(self.success50.uiColor().darker(percentage: 30)) }
	//public var success50: SystemColor
	public var success20:  SystemColor { Color(self.success50.uiColor().lighter(percentage: 30)) }
	
	public var warning80:  SystemColor { Color(self.warning50.uiColor().darker(percentage: 30)) }
	//public var warning50: SystemColor
	public var warning20:  SystemColor { Color(self.warning50.uiColor().lighter(percentage: 30)) }
}

public extension ColorProvider {
	//MARK: Public Shared
	static var shared: ColorProvider = {
		.init(primary50: .init(colorHex: 0x3535F3),
			  primaryInverse: .init(colorHex: 0xFFFFFF),
			  
			  secondary50: .init(colorHex: 0xF7AB20),
			  secondaryInverse: .init(colorHex: 0x401D0C),
			  
			  sparkle50: .init(colorHex: 0x1ECCB0),
			  sparkleInverse: .init(colorHex: 0x08332C),
			  
			  gray100: .init(colorHex: 0x141414),
			  
			  error50: .init(colorHex: 0xF50031),
			  success50: .init(colorHex: 0x25AB21),
			  warning50: .init(colorHex: 0xF06D0F),
			  
			  primaryBackground: .init(colorHex: 0xFFFFFF),
			  pageBackground: .init(colorHex: 0x979797)
		)
	}()
}


//MARK: Property updaters
public extension ColorProvider {
	@discardableResult
	func primary50(_ primary50: SystemColor, autoUpdateToOtherControls: Bool) -> Self {
		self.primary50 = primary50;
		
		if autoUpdateToOtherControls {
			NitrozenAppearance.shared.primaryButton
				.backgroundColor(primary50)
				.backgroundColorDisabled(primary50.opacity(0.3))
			
			NitrozenAppearance.shared.borderedButton
				.titleColor(primary50)
				.titleColorDisabled(primary50.opacity(0.3))
			
			
			NitrozenAppearance.shared.radioButton
				.selectedBorderColor(primary50)
			
			NitrozenAppearance.shared.checkbox
				.selectedTitle(NitrozenAppearance.shared.checkbox.selectedTitle.copy.titleColor(primary50))
				.selectedBorderColor(primary50)
			
			NitrozenAppearance.shared.toggle
				.onState
				.backgroundColor(primary50)
		}
		
		return self
	}
	
	@discardableResult
	func primaryInverse(_ primaryInverse: SystemColor) -> Self { self.primaryInverse = primaryInverse; return self }
	
	@discardableResult
	func secondary50(_ secondary50: SystemColor) -> Self { self.secondary50 = secondary50; return self }
	
	@discardableResult
	func secondaryInverse(_ secondaryInverse: SystemColor) -> Self { self.secondaryInverse = secondaryInverse; return self }
	
	@discardableResult
	func sparkle50(_ sparkle50: SystemColor) -> Self { self.sparkle50 = sparkle50; return self }
	
	@discardableResult
	func sparkleInverse(_ sparkleInverse: SystemColor) -> Self { self.sparkleInverse = sparkleInverse; return self }
	
	@discardableResult
	func gray100(_ gray100: SystemColor) -> Self { self.gray100 = gray100; return self }
	
	@discardableResult
	func error50(_ error50: SystemColor) -> Self { self.error50 = error50; return self }
	
	@discardableResult
	func success50(_ success50: SystemColor) -> Self { self.success50 = success50; return self }
	
	@discardableResult
	func warning50(_ warning50: SystemColor) -> Self { self.warning50 = warning50; return self }
	
	@discardableResult
	func primaryBackground(_ primaryBackground: SystemColor) -> Self { self.primaryBackground = primaryBackground; return self }
	
	@discardableResult
	func pageBackground(_ pageBackground: SystemColor) -> Self { self.pageBackground = pageBackground; return self }
}



//MARK: Copy Support
public extension ColorProvider {
	var copy: ColorProvider {
		.init(primary50: self.primary50, primaryInverse: self.primaryInverse, secondary50: self.secondary50, secondaryInverse: self.secondaryInverse, sparkle50: self.sparkle50, sparkleInverse: self.sparkleInverse, gray100: self.gray100, error50: self.error50, success50: self.success50, warning50: self.warning50, primaryBackground: self.primaryBackground, pageBackground: self.pageBackground)
	}
}
