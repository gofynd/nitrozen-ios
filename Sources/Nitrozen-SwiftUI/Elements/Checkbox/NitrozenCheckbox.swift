//
//  NitrozenCheckbox.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 05/04/23.
//

import SwiftUI

//MARK: NitrozenCheckbox
public struct NitrozenCheckbox<Element>: View where Element: NitrozenElementStringSelectableStyle & Hashable {
	public enum Layout {
		case horizontal, verticle
	}
	
	var options: Array<Element>
	@Binding var selection: Set<Element>
	var layout: Layout
	var appearance: NitrozenAppearance.Checkbox
	
	public init(options: Array<Element>, selection: Binding<Set<Element>>,
		 layout: Layout, appearance: NitrozenAppearance.Checkbox? = nil) {
		self.options = options
		self._selection = selection
		self.layout = layout
		self.appearance = appearance.or(NitrozenAppearance.shared.checkbox)
	}
	
	public var body: some View {
		switch self.layout {
		case .horizontal:
			HStack {
				listView()
			}
		case .verticle:
			VStack {
				listView()
			}
		}
	}
	
	@ViewBuilder
	func listView() -> some View {
		ForEach(self.options, id: \.hashValue) { item in
			NitrozenCheckboxItem(
				isSelected: selection.contains(item),
				title: item.selectionTitle,
				appearance: self.appearance
			)
			.onTapGesture {
				withAnimation {
					if self.selection.contains(item) {
						self.selection.remove(item)
					}else {
						self.selection.insert(item)
					}
				}
			}
		}
	}
}

//MARK: NitrozenCheckboxItem
struct NitrozenCheckboxItem: View {
	
	var isSelected: Bool
	var title: String
	var appearance: NitrozenAppearance.Checkbox
	
	public init(
		isSelected: Bool,
		title: String,
		appearance: NitrozenAppearance.Checkbox? = nil
	) {
		self.isSelected = isSelected
		self.title = title
		self.appearance = appearance.or(NitrozenAppearance.shared.checkbox)
	}
	
	public var body: some View {
		if isSelected {
			selectedView()
		} else {
			deSelectedView()
		}
	}
	
	@ViewBuilder
	func selectedView() -> some View {
		HStack {
			ZStack {
				RoundedRectangle(cornerRadius: 4, style: .continuous)
					.stroke(style: .init(lineWidth: self.appearance.selectedBorderWidth))
				
				self.appearance.selectedImage
					.foregroundColor(self.appearance.selectedColor)
			}
			.frame(width: self.appearance.size.width, height: self.appearance.size.height)
			
			Text(self.title)
				.font(self.appearance.selectedTitle.font)
				.foregroundColor(self.appearance.selectedTitle.titleColor)
				.frame(maxWidth: .infinity, alignment: .leading)
		}
	}
	
	@ViewBuilder
	func deSelectedView() -> some View {
		HStack {
			RoundedRectangle(cornerRadius: 4, style: .continuous)
				.stroke(style: .init(lineWidth: self.appearance.deselectedBorderWidth))
				.frame(width: self.appearance.size.width, height: self.appearance.size.height)
			
			Text(self.title)
				.font(self.appearance.deSelectedTitle.font)
				.foregroundColor(self.appearance.deSelectedTitle.titleColor)
				.frame(maxWidth: .infinity, alignment: .leading)
		}
	}
}