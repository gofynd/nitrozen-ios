//
//  File.swift
//  
//
//  Created by Hitendra Solanki on 20/04/23.
//

import SwiftUI

public extension NitrozenViewBox {
	func eraseToAnyView() -> AnyView {
		AnyView(self.value)
	}
}
