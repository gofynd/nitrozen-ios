//
//  NitrozenSegmentControl.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 20/04/23.
//

import SwiftUI

//MARK: NitrozenSegmentControl
public struct NitrozenSegmentControl<Element>: View where Element: NitrozenElementStringSelectableStyle & Hashable & Identifiable {
	
	//TODO: Hitendra - combine this common usage and change scope to align with Alert and actionSheet in future once other MR merged
	public enum CustomLabelView {
		case nitrozen(text: String) //default view with title text
		case custom(view: AnyView) // whole customized view
	}
	
	var options: Array<Element>
	@Binding var selection: Element
	var selectionIndex: Int {
		options.firstIndex(of: selection) ?? 0
	}
	
	var appearance: NitrozenAppearance.Segment
	var itemBuilder: ((Element, Bool) -> any View)?

	
	@State private var currentSelectedIndex: Int = 0
	@State private var allSegmentItemRectDataWithIndex: [Int: CGRect] = [:]

	
	public init(
		options: Array<Element>, selection: Binding<Element>,
		itemBuilder: ((Element, Bool) -> any View)? = nil,
		appearance: NitrozenAppearance.Segment? = nil
	) {
		self.options = options
		self._selection = selection
		self.appearance = appearance.or(NitrozenAppearance.shared.segment)
		self.itemBuilder = itemBuilder
	}
	
	public var body: some View {
		// Align the ZStack to the leading edge to make calculating offset on activeSegmentView easier
		ZStack(alignment: .leading) {
			// activeSegmentView indicates the current selection
			self.currentSelectedItemBackgroundView()
			
			HStack(spacing: 0) {
				
				ForEach(0..<self.options.count, id: \.self) { i in
					let item = self.options[i]
					
					itemView(item: item, isSelected: item == self.selection)
						.nitrozen.frameAwareSelectionView(viewID: i, selectedViewID: $currentSelectedIndex, allViewRects: $allSegmentItemRectDataWithIndex, coordinateSpaceName: "parentZStack")
						.frame(width: self.appearance.itemSize.width, height: self.appearance.itemSize.height)
						.onTapGesture {
							withAnimation {
								if self.selection != item {
									self.selection = item
								}
								self.currentSelectedIndex = self.selectionIndex
							}
						}
					
					if i < self.options.count - 1 {
						let spacing = self.appearance.itemSpacing
						Spacer()
							.if(spacing == .infinity, contentTransformer: { view in
									view.frame(maxWidth: spacing)
							})
								.if(spacing != .infinity, contentTransformer: { view in
										view.frame(width: spacing)
								})
					}
					
				}
			}
		}
		.coordinateSpace(name: "parentZStack")
		.apply(padding: self.appearance.backgroundPadding)
		.background(self.appearance.backgroundColor)
		.apply(shape: self.appearance.viewShape, color: self.appearance.borderColor, lineWidth: self.appearance.borderWidth)
		.onAppear {
			self.currentSelectedIndex = self.selectionIndex
		}
	}
	
	@ViewBuilder
	func itemView(item: Element, isSelected: Bool) -> some View {
		
		let isSelected = self.selection == item
		let titleView: CustomLabelView = self.itemBuilder
			.convert { builder in
				NitrozenSegmentControl.CustomLabelView.custom(view: AnyView(builder(item, isSelected)))
			}.or(
				NitrozenSegmentControl.CustomLabelView.nitrozen(text: item.selectionTitle)
			)
		
		let color = isSelected ? self.appearance.selectedTitleAppearance.titleColor : self.appearance.titleAppearance.titleColor
		let font = isSelected ? self.appearance.selectedTitleAppearance.font : self.appearance.titleAppearance.font
		
		customLabelView(labelView: titleView, font: font, color: color)
	}
	
	@ViewBuilder
	func customLabelView(labelView: CustomLabelView, font: SystemFont, color: SystemColor) -> some View {
		switch labelView {
		case .nitrozen(let text):
			self.titleView(title: text, font: font, color: color)
		case .custom(let customView):
			customView
		}
	}
	
	@ViewBuilder
	func titleView(title: String, font: SystemFont, color: SystemColor) -> some View {
		Text(title)
			.font(font)
			.foregroundColor(color)
	}
	
	@ViewBuilder
	func currentSelectedItemBackgroundView() -> some View {
		Rectangle()
			.fill(self.appearance.selectedBackgroundColor)
			.apply(shape: self.appearance.selectedViewShape, color: self.appearance.selectedBorderColor, lineWidth: self.appearance.selectedBorderWidth)
			.frame(width: self.appearance.itemSize.width, height: self.appearance.itemSize.height)
			.offset(x: (allSegmentItemRectDataWithIndex[currentSelectedIndex]?.midX).or(0) - self.appearance.itemSize.width/2, y: 0)
			.animation(Animation.easeInOut(duration: 0.16))
	}
}
