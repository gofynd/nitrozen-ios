//
//  SegmentControl+Appearance.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 19/04/23.
//

import Foundation

public extension NitrozenAppearance {
	class Segment {
		public var backgroundColor: SystemColor
		public var borderColor: SystemColor
		public var borderWidth: CGFloat
		public var viewShape: ViewShape
		public var titleAppearance: NitrozenAppearance.TextLabel

		public var selectedBackgroundColor: SystemColor
		public var selectedBorderColor: SystemColor
		public var selectedBorderWidth: CGFloat
		public var selectedTitleAppearance: NitrozenAppearance.TextLabel
		
		public var itemSize: CGSize
		public var itemSpacing: CGFloat
		
		public var selectedViewShape: ViewShape
		public var backgroundPadding: ViewPadding
		
		init(backgroundColor: SystemColor, borderColor: SystemColor, borderWidth: CGFloat, viewShape: ViewShape, titleAppearance: NitrozenAppearance.TextLabel, selectedBackgroundColor: SystemColor, selectedBorderColor: SystemColor, selectedBorderWidth: CGFloat, selectedTitleAppearance: NitrozenAppearance.TextLabel,
			 itemSize: CGSize, itemSpacing: CGFloat,
			 selectedViewShape: ViewShape, backgroundPadding: ViewPadding) {
			self.backgroundColor = backgroundColor
			self.borderColor = borderColor
			self.borderWidth = borderWidth
			self.viewShape = viewShape
			self.titleAppearance = titleAppearance
			self.selectedBackgroundColor = selectedBackgroundColor
			self.selectedBorderColor = selectedBorderColor
			self.selectedBorderWidth = selectedBorderWidth
			self.selectedTitleAppearance = selectedTitleAppearance
			self.itemSize = itemSize
			self.itemSpacing = itemSpacing
			self.selectedViewShape = selectedViewShape
			self.backgroundPadding = backgroundPadding
		}
	}
}

public extension NitrozenAppearance.Segment {
	@discardableResult
	func backgroundColor(_ backgroundColor: SystemColor) -> Self { self.backgroundColor = backgroundColor; return self }
	
	@discardableResult
	func borderColor(_ borderColor: SystemColor) -> Self { self.borderColor = borderColor; return self }
	
	@discardableResult
	func borderWidth(_ borderWidth: CGFloat) -> Self { self.borderWidth = borderWidth; return self }
	
	@discardableResult
	func viewShape(_ selectedViewShape: ViewShape) -> Self { self.selectedViewShape = viewShape; return self }
	
	@discardableResult
	func titleAppearance(_ titleAppearance: NitrozenAppearance.TextLabel) -> Self { self.titleAppearance = titleAppearance; return self }
	
	@discardableResult
	func selectedBackgroundColor(_ selectedBackgroundColor: SystemColor) -> Self { self.selectedBackgroundColor = selectedBackgroundColor; return self }
	
	@discardableResult
	func selectedBorderColor(_ selectedBorderColor: SystemColor) -> Self { self.selectedBorderColor = selectedBorderColor; return self }
	
	@discardableResult
	func selectedBorderWidth(_ selectedBorderWidth: CGFloat) -> Self { self.selectedBorderWidth = selectedBorderWidth; return self }
	
	@discardableResult
	func selectedTitleAppearance(_ selectedTitleAppearance: NitrozenAppearance.TextLabel) -> Self { self.selectedTitleAppearance = selectedTitleAppearance; return self }
	
	@discardableResult
	func itemSize(_ itemSize: CGSize) -> Self { self.itemSize = itemSize; return self }
	
	@discardableResult
	func selectedViewShape(_ selectedViewShape: ViewShape) -> Self { self.selectedViewShape = selectedViewShape; return self }
	
	@discardableResult
	func itemSpacing(_ itemSpacing: CGFloat) -> Self { self.itemSpacing = itemSpacing; return self }
	
	@discardableResult
	func backgroundPadding(_ backgroundPadding: ViewPadding) -> Self { self.backgroundPadding = backgroundPadding; return self }
}

//MARK: Copy Support
public extension NitrozenAppearance.Segment {
	var copy: NitrozenAppearance.Segment {
		.init(
			backgroundColor: self.backgroundColor,
			borderColor: self.borderColor,
			borderWidth: self.borderWidth,
			viewShape: self.viewShape,
			titleAppearance: self.titleAppearance,
			
			selectedBackgroundColor: self.selectedBackgroundColor,
			selectedBorderColor: self.selectedBorderColor,
			selectedBorderWidth: self.selectedBorderWidth,
			selectedTitleAppearance: self.selectedTitleAppearance,
			itemSize: self.itemSize,
			itemSpacing: self.itemSpacing,
			selectedViewShape: self.selectedViewShape,
			backgroundPadding: self.backgroundPadding
		)
	}
}

