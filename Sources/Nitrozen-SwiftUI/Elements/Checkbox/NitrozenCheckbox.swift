//
//  NitrozenCheckbox.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 05/04/23.
//

import SwiftUI
import CollectionStack_SwiftUI

//MARK: NitrozenCheckbox
public struct NitrozenCheckbox<Element>: View where Element: NitrozenElementStringSelectableStyle & Hashable & Identifiable {
	public enum Layout {
		case horizontal, verticle, collection
	}
	
	var options: Array<Element>
	@Binding var selection: Set<Element>
	var layout: Layout
	var itemSpacing: CGFloat
	var appearance: NitrozenAppearance.Checkbox
	
	public init(options: Array<Element>, selection: Binding<Set<Element>>,
		 layout: Layout, itemSpacing: CGFloat = 8, appearance: NitrozenAppearance.Checkbox? = nil) {
		self.options = options
		self._selection = selection
		self.layout = layout
		self.itemSpacing = itemSpacing
		self.appearance = appearance.or(NitrozenAppearance.shared.checkbox)
	}
	
	public var body: some View {
		switch self.layout {
		case .horizontal:
			HStack(alignment: .top, spacing: self.itemSpacing) {
				ForEach(self.options, id: \.hashValue) { item in
					itemView(item: item, width: .infinity)
				}
			}
		case .verticle:
			VStack(alignment: .leading, spacing: self.itemSpacing) {
				ForEach(self.options, id: \.hashValue) { item in
					itemView(item: item, width: .infinity)
				}
			}
		case .collection:
			CollectionStack(self.options) { item in
				itemView(item: item, width: .dynamic(itemSpacing: self.itemSpacing))
			}
		}
	}
	
	@ViewBuilder
	func itemView(item: Element, width: NitrozenCheckboxItem.Width) -> some View {
		NitrozenCheckboxItem(
			isSelected: selection.contains(item),
			title: item.selectionTitle,
			width: width,
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

//MARK: NitrozenCheckboxItem
public struct NitrozenCheckboxItem: View {
	
	public enum Width: Hashable, Equatable {
		case dynamic(itemSpacing: CGFloat), infinity
		public func hash(into hasher: inout Hasher) {
			switch self {
			case .infinity: hasher.combine("infinity")
			case .dynamic: hasher.combine("dynamic")
			}
		}
		
		public static func == (lhs: Self, rhs: Self) -> Bool {
			lhs.hashValue == rhs.hashValue
		}
		
		var itemSpacing: CGFloat {
			switch self {
			case .infinity: return 0;
			case .dynamic(let itemSpacing): return itemSpacing
			}
		}
	}
	
	var isSelected: Bool
	var title: String?
	var width: Width
	var appearance: NitrozenAppearance.Checkbox
	
	public init(
		isSelected: Bool,
		title: String?,
		width: Width = .infinity,
		appearance: NitrozenAppearance.Checkbox? = nil
	) {
		self.isSelected = isSelected
		self.title = title
		self.width = width
		self.appearance = appearance.or(NitrozenAppearance.shared.checkbox)
	}
	
	public var body: some View {
		Group {
			if isSelected {
				selectedView()
			} else {
				deSelectedView()
			}
		}
		.if(self.width == .infinity, contentTransformer: { view in
			view
				.frame(maxWidth: .infinity, alignment: .leading)
		}).if(self.width == .dynamic(itemSpacing: 0)) { view in
			view
				.padding(.trailing, self.width.itemSpacing)
				.padding(.bottom, self.width.itemSpacing)
		}
		.contentShape(Rectangle()) //for user interaction in all the area
	}
	
	@ViewBuilder
	func selectedView() -> some View {
		HStack {
			ZStack {
				Group {
					RoundedRectangle(cornerRadius: 4, style: .continuous)
						.stroke(self.appearance.selectedBorderColor, lineWidth: self.appearance.selectedBorderWidth)
						.frame(width: self.appearance.size.width, height: self.appearance.size.height)
					
					self.appearance.selectedImage
						.foregroundColor(self.appearance.selectedBorderColor)
				}
				.frame(width: self.appearance.size.width, height: self.appearance.size.height)
			}
			
			self.title.convertToView { title in
				titleView(title: title, font: self.appearance.selectedTitle.font, color: self.appearance.selectedTitle.titleColor)
			}
			
		}
	}
	
	@ViewBuilder
	func deSelectedView() -> some View {
		HStack {
			Group {
				RoundedRectangle(cornerRadius: 4, style: .continuous)
					.stroke(self.appearance.deSelectedBorderColor, lineWidth: self.appearance.deselectedBorderWidth)
			}
			.frame(width: self.appearance.size.width, height: self.appearance.size.height)
			
			
			self.title.convertToView { title in
				AnyView(titleView(title: title, font: self.appearance.deSelectedTitle.font, color: self.appearance.deSelectedTitle.titleColor))
			}
		}
	}
	
	@ViewBuilder
	func titleView(title: String, font: SystemFont, color: SystemColor) -> some View {
		Text(title)
			.font(font)
			.foregroundColor(color)
	}
}
