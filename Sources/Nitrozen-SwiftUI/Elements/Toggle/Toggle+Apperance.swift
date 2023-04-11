//
//  Toggle+Apperance.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 12/04/23.
//

import Foundation

public extension NitrozenAppearance {
	class Toggle {
		public class State {
			var backgroundColor: SystemColor
			var borderColor: SystemColor
			var borderWidth: CGFloat
			
			var thumbColor: SystemColor
			var thumbBorderColor: SystemColor
			var thumbBorderWidth: CGFloat
			
			public init(backgroundColor: SystemColor, borderColor: SystemColor, borderWidth: CGFloat, thumbColor: SystemColor, thumbBorderColor: SystemColor, thumbBorderWidth: CGFloat) {
				self.backgroundColor = backgroundColor
				self.borderColor = borderColor
				self.borderWidth = borderWidth
				self.thumbColor = thumbColor
				self.thumbBorderColor = thumbBorderColor
				self.thumbBorderWidth = thumbBorderWidth
			}
		}
		
		public var onState: NitrozenAppearance.Toggle.State
		public var offState: NitrozenAppearance.Toggle.State
		public var size: CGSize
		public var thumbSize: CGSize
		public var thumbPadding: ViewPadding
		
		init(
			onState: NitrozenAppearance.Toggle.State,
			offState: NitrozenAppearance.Toggle.State,
			size: CGSize,
			thumbSize: CGSize,
			thumbPadding: ViewPadding
		) {
			self.onState = onState
			self.offState = offState
			self.size = size
			self.thumbSize = thumbSize
			self.thumbPadding = thumbPadding
		}
	}
}


public extension NitrozenAppearance.Toggle {
	@discardableResult
	func onState(_ onState: NitrozenAppearance.Toggle.State) -> Self { self.onState = onState; return self }
	
	@discardableResult
	func offState(_ offState: NitrozenAppearance.Toggle.State) -> Self { self.offState = offState; return self }
	
	@discardableResult
	func size(_ size: CGSize) -> Self { self.size = size; return self }
	
	@discardableResult
	func thumbSize(_ thumbSize: CGSize) -> Self { self.thumbSize = thumbSize; return self }
	
	@discardableResult
	func thumbPadding(_ thumbPadding: ViewPadding) -> Self { self.thumbPadding = thumbPadding; return self }
}


//MARK: Copy Support
public extension NitrozenAppearance.Toggle {
	var copy: NitrozenAppearance.Toggle {
		.init(
			onState: self.onState.copy,
			offState: self.offState.copy,
			size: self.size,
			thumbSize: self.thumbSize,
			thumbPadding: self.thumbPadding
		)
	}
}

public extension NitrozenAppearance.Toggle.State {
	@discardableResult
	func backgroundColor(_ backgroundColor: SystemColor) -> Self { self.backgroundColor = backgroundColor; return self }
	
	@discardableResult
	func borderColor(_ borderColor: SystemColor) -> Self { self.borderColor = borderColor; return self }
	
	@discardableResult
	func borderWidth(_ borderWidth: CGFloat) -> Self { self.borderWidth = borderWidth; return self }
	
	@discardableResult
	func thumbColor(_ thumbColor: SystemColor) -> Self { self.thumbColor = thumbColor; return self }
	
	@discardableResult
	func thumbBorderColor(_ thumbBorderColor: SystemColor) -> Self { self.thumbBorderColor = thumbBorderColor; return self }
	
	@discardableResult
	func thumbBorderWidth(_ thumbBorderWidth: CGFloat) -> Self { self.thumbBorderWidth = thumbBorderWidth; return self }
}

//MARK: Copy Support
public extension NitrozenAppearance.Toggle.State {
	var copy: NitrozenAppearance.Toggle.State {
		.init(
			backgroundColor: self.backgroundColor,
			borderColor: self.borderColor,
			borderWidth: self.borderWidth,
			thumbColor: self.thumbColor,
			thumbBorderColor: self.thumbBorderColor,
			thumbBorderWidth: self.thumbBorderWidth
		)
	}
}
