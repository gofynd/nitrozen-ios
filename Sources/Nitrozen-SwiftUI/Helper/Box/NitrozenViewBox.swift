//
//  NitrozenViewBox.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 10/04/23.
//

import SwiftUI

public struct NitrozenViewBox<T: View> {
	public var value: T
	public init(value: T) {
		self.value = value
	}
}

public extension View {
	var nitrozen: NitrozenViewBox<Self> {
		return NitrozenViewBox(value: self)
	}
}
