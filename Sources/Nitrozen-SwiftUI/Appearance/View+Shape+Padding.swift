//
//  View+Shape+Padding.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 18/03/23.
//

import SwiftUI

public enum ViewShape { case capsule, circle, roundedRectangle(radius: CGFloat) ,none }

public extension ViewShape {
	var radius: CGFloat {
		switch self {
		case .capsule: return 0
		case .circle: return 0
		case .roundedRectangle(let radius): return radius
		case .none: return 0
		}
	}
}

extension ViewShape: Hashable, Equatable {
	public func hash(into hasher: inout Hasher) {
		switch self {
		case .capsule: hasher.combine("capsule")
		case .circle: hasher.combine("circle")
		case .roundedRectangle: hasher.combine("roundedRectangle")
		case .none: hasher.combine("none")
		}
	}
	
	public static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.hashValue == rhs.hashValue
	}
}

public enum ViewPadding {
	
	///not padding
	case zero
	
	///System default padding -- padding values will  be decided by apple based defference devices/size/deviceSettings
	case systemDefault
	
	///System default padding that can be customized using values to modifiy it
	/// pass -ve value to decrease the systemDefault padding
	/// pass +ve value to increase the systemDefault padding
	case sytemDefaultAddingCustom(paddingToAdd: NSDirectionalEdgeInsets)
	
	///custom default padding that can be decided by developer/API caller
	/// pass -ve value to decrease the existing padding
	/// pass +ve value to increase the existing padding
	case custom(paddingToAdd: NSDirectionalEdgeInsets)
	
}

extension ViewPadding: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(self.caseLevelHashValue)
	}
	private var caseLevelHashValue: String {
		switch self {
		case .zero: return "zero"
		case .systemDefault: return "systemDefault"
		case .sytemDefaultAddingCustom: return "sytemDefaultAddingCustom"
		case .custom: return "custom"
		}
	}
}

extension View {
	func apply(padding: ViewPadding) -> some View {
		Group {
			switch padding {
			case .zero:
				self.padding(0)
			case .systemDefault:
				self.padding()
			case .sytemDefaultAddingCustom(let paddingToAdd):
				self.padding().padding(
					.init(top: paddingToAdd.top, leading: paddingToAdd.leading, bottom: paddingToAdd.bottom, trailing: paddingToAdd.trailing)
				)
			case .custom(let paddingToAdd):
				self.padding(
					.init(top: paddingToAdd.top, leading: paddingToAdd.leading, bottom: paddingToAdd.bottom, trailing: paddingToAdd.trailing)
				)
			}
		}
	}
}

extension View {
	func apply(shape: ViewShape, color: SystemColor, lineWidth: CGFloat) -> some View {
		self
			.if(shape == .roundedRectangle(radius: .zero)) { view in
				view
					.nitrozen.roundedCornerWithBorder(color: color, radius: shape.radius, lineWidth: lineWidth)
			}
			.if(shape == .capsule, contentTransformer: { view in
				view
					.nitrozen.capsuleWithBorder(color: color, lineWidth: lineWidth)
				
			})
				.if(shape == .circle, contentTransformer: { view in
					view
						.nitrozen.circleWithBorder(color: color, lineWidth: lineWidth)
				})
					.if(shape == .none, contentTransformer: { view in
						view
					})
	}
}

