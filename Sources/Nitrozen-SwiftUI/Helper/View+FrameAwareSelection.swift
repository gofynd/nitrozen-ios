//
//  File.swift
//  
//
//  Created by Hitendra Solanki on 20/04/23.
//

import SwiftUI

struct CGRectPreferenceData: Equatable {
	let id: Int //view id
	let rect: CGRect //view rect
}

struct CGRectSelectionPreferenceKey: PreferenceKey {
	typealias Value = [Int : CGRectPreferenceData]

	static var defaultValue: Value = [:] //view rect data with ID
	
	static func reduce(value: inout Value, nextValue: () -> Value) {
		let nextV = nextValue()
		nextV.forEach { (k, v) in
			value[k] = v
		}
	}
}

struct CGRectSelectionPreferenceKeyAwareView: View {
	let id: Int
	let coordinateSpaceName: String
	
	var body: some View {
		GeometryReader { geometry in
			Rectangle()
				.fill(Color.clear)
				.preference(key: CGRectSelectionPreferenceKey.self,
							value: [self.id: CGRectPreferenceData(id: self.id, rect: geometry.frame(in: .named(coordinateSpaceName)))])
		}
	}
}

struct CGRectSelectionAwareViewModifier: ViewModifier {
	let viewID: Int
	@Binding var selectedViewID: Int
	@Binding var allViewRects: [Int: CGRect]
	let coordinateSpaceName: String

	init(viewID: Int, selectedViewID: Binding<Int>, allViewRects: Binding<[Int: CGRect]>, coordinateSpaceName: String) {
		self.viewID = viewID
		self._selectedViewID = selectedViewID
		self._allViewRects = allViewRects
		self.coordinateSpaceName = coordinateSpaceName
	}

	func body(content: Content) -> some View {
		content
			.background(CGRectSelectionPreferenceKeyAwareView(id: viewID, coordinateSpaceName: coordinateSpaceName))
			.onPreferenceChange(CGRectSelectionPreferenceKey.self) { preferences in
				for p in preferences {
					self.allViewRects[p.key] = p.value.rect
				}
			}
	}
}

extension NitrozenViewBox {
	func frameAwareSelectionView(viewID: Int, selectedViewID: Binding<Int>, allViewRects: Binding<[Int: CGRect]>, coordinateSpaceName: String) -> some View {
		self.value.modifier(CGRectSelectionAwareViewModifier(viewID: viewID, selectedViewID: selectedViewID, allViewRects: allViewRects, coordinateSpaceName: coordinateSpaceName))
	}
}
