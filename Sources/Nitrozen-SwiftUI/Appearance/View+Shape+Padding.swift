//
//  View+Shape+Padding.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 18/03/23.
//

import SwiftUI

public enum ViewShape { case capsule, circle, none }

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

