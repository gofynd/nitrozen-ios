//
//  NitrozenTagView.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 08/04/23.
//

import SwiftUI
import CollectionStack_SwiftUI

//MARK: NitrozenTagView
public struct NitrozenTagView<Element>: View where Element: NitrozenElementStringSelectableStyle & Hashable & Identifiable {
	
	public enum Selection {
		case single, multiple
	}
	
	var options: Array<Element>
	@Binding var selection: Set<Element>
	var spacing: CGFloat
	var allowedSelection: Selection
	var appearance: NitrozenAppearance.TagView
	var itemBuilder: ((Element, Bool) -> any View)?
	
	public init(
		options: Array<Element>, selection: Binding<Set<Element>>,
		spacing: CGFloat, allowedSelection: Selection,
		itemBuilder: ((Element, Bool) -> any View)? = nil,
		appearance: NitrozenAppearance.TagView? = nil
	) {
		self.options = options
		self._selection = selection
		self.spacing = spacing
		self.allowedSelection = allowedSelection
		self.appearance = appearance.or(NitrozenAppearance.shared.tagView)
		self.itemBuilder = itemBuilder
	}
	
	public var body: some View {
		CollectionStack(self.options) { item in
			itemView(item: item)
		}
	}
	
	@ViewBuilder
	func itemView(item: Element) -> some View {
		
		let isSelected = self.selection.contains(item)
		let titleView: NitrozenTagViewItem.CustomLabelView = self.itemBuilder
			.convert { builder in
				NitrozenTagViewItem.CustomLabelView.custom(view: AnyView(builder(item, isSelected)))
			}.or(
				NitrozenTagViewItem.CustomLabelView.nitrozen(text: item.selectionTitle)
			)
		
		NitrozenTagViewItem(
			isSelected: selection.contains(item),
			titleView: titleView,
			clearActionView: .nitrozen,
			appearance: appearance
		)
		.onTapGesture {
			withAnimation {
				if self.selection.contains(item) {
					self.selection.remove(item)
				}else {
					switch self.allowedSelection {
					case .multiple: break
					case .single: self.selection.removeAll(keepingCapacity: true)
					}
					self.selection.insert(item)
				}
			}
		}
		.padding(.trailing, spacing)
		.padding(.bottom, spacing)
	}
}


//MARK: NitrozenTagViewItem
public struct NitrozenTagViewItem: View {
	
	//TODO: Hitendra - combine this common usage and change scope to align with Alert and actionSheet in future once other MR merged
	public enum CustomImageView {
		case nitrozen //default view
		case systemImage(name: String) //customized image from SFSymbol
		case assetImage(name: String) //customized image from .xcassets
		case custom(view: AnyView) // whole customized view
	}
	
	//TODO: Hitendra - combine this common usage and change scope to align with Alert and actionSheet in future once other MR merged
	public enum CustomLabelView {
		case nitrozen(text: String) //default view with title text
		case custom(view: AnyView) // whole customized view
	}
	
	
	
	var isSelected: Bool
	var titleView: CustomLabelView
	var clearActionView: CustomImageView
	
	var appearance: NitrozenAppearance.TagView
	
	init(isSelected: Bool,
		 titleView: CustomLabelView, clearActionView: CustomImageView,
		 appearance: NitrozenAppearance.TagView? = nil
	) {
		self.isSelected = isSelected
		self.titleView = titleView
		self.clearActionView = clearActionView
		self.appearance = appearance.or(NitrozenAppearance.shared.tagView)
	}
	
	public var body: some View {
		Group {
			if isSelected {
				selectedView()
			} else {
				deSelectedView()
			}
		}
		.contentShape(Rectangle()) //for user interaction in all the area
	}
	
	@ViewBuilder
	func selectedView() -> some View {
		HStack {
			switch self.titleView {
			case .nitrozen(let text):
				self.titleView(title: text, font: self.appearance.selectedTitle.font, color: self.appearance.selectedTitle.titleColor)
			case .custom(let customView):
				customView
			}
			
			clearIconView()
		}
		.apply(padding: self.appearance.padding)
		.background(self.appearance.selectedBorderColor.opacity(0.1))
		.nitrozen.capsuleWithBorder(color: self.appearance.selectedBorderColor, lineWidth: self.appearance.selectedBorderWidth)
	}
	
	@ViewBuilder
	func deSelectedView() -> some View {
		HStack {
			switch self.titleView {
			case .nitrozen(let text):
				self.titleView(title: text, font: self.appearance.deSelectedTitle.font, color: self.appearance.deSelectedTitle.titleColor)
			case .custom(let customView):
				customView
			}
		}
		.apply(padding: self.appearance.padding)
		.nitrozen.capsuleWithBorder(color: self.appearance.deselectedBorderColor, lineWidth: self.appearance.deselectedBorderWidth)
	}
	
	@ViewBuilder
	func clearIconView() -> some View {
		switch self.clearActionView {
		case .systemImage(let imageName):
			Image(systemName: imageName)
			
		case .assetImage(let imageName):
			Image(imageName)
			
		case .custom(let customView):
			customView
			
		case .nitrozen:
			Image(systemName: "xmark")
		}
	}
	
	@ViewBuilder
	func titleView(title: String, font: SystemFont, color: SystemColor) -> some View {
		Text(title)
			.font(font)
			.foregroundColor(color)
	}
}
