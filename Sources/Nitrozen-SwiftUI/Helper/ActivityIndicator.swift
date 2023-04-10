//
//  ActivityIndicator.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 17/03/23.
//

import ActivityIndicatorView
import SwiftUI

struct LoadingIndicatorView: View {
	var isLoading: Bool
	var color: SystemColor
	
	var body: some View {
		ActivityIndicatorView(
			isVisible: Binding(get: { isLoading }, set: { let _ = $0 /*no action required*/ }),
			type: .equalizer(count: 5)
		)
	}
}
