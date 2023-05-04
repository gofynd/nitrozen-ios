//
//  NitrozenSegmentControl.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 20/04/23.
//

import SwiftUI

//MARK: NitrozenSegmentControl
public struct NitrozenSegmentControl<Element>: View where Element: NitrozenElementStringSelectableStyle & Hashable & Identifiable {
	
	public enum SegmentSelectionStyle {
		case backgroundCapsule
		case underline(height: CGFloat)
		
		var underlineHeight: CGFloat {
			switch self {
			case .backgroundCapsule: return 0
			case .underline(let height): return height
			}
		}
	}
	
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
	
	var selectionStyle: SegmentSelectionStyle
	var appearance: NitrozenAppearance.Segment
	var itemBuilder: ((Element, Bool) -> any View)?
	
	var isScrollableEnabled: Bool
	
	@State private var currentSelectedIndex: Int = 0
	@State private var allSegmentItemRectDataWithIndex: [Int: CGRect] = [:]
	
	public init(
		options: Array<Element>, selection: Binding<Element>,
		itemBuilder: ((Element, Bool) -> any View)? = nil,
		selectionStyle: SegmentSelectionStyle = .backgroundCapsule,
		isScrollableEnabled: Bool = false,
		appearance: NitrozenAppearance.Segment? = nil
	) {
		self.options = options
		self._selection = selection
		self.selectionStyle = selectionStyle
		self.isScrollableEnabled = isScrollableEnabled
		
		self.appearance = appearance.or(block: {
			switch selectionStyle {
			case .backgroundCapsule:
				return NitrozenAppearance.shared.capsuleSegment
			case .underline:
				return NitrozenAppearance.shared.underlineSegment
				
			}
		})
		
		
		
		self.itemBuilder = itemBuilder
	}
	
	var zStackAlignment: Alignment {
		switch self.selectionStyle {
		case .backgroundCapsule:
				return .leading
		case .underline:
			return .bottomLeading
		}
	}
	
	class Model {
		var contentViewSize: CGSize = .zero
		init(contentViewSize: CGSize) {
			self.contentViewSize = contentViewSize
		}
	}
	var model: Model = .init(contentViewSize: .zero)
	
	public var body: some View {
		GeometryReader { geometry in
			let _ = self.model.contentViewSize = geometry.size //save main content size
			
			// Align the ZStack to the leading edge to make calculating offset on activeSegmentView easier
			ZStack(alignment: self.zStackAlignment) {
				// activeSegmentView indicates the current selection
				self.currentSelectedItemBackgroundView()
				
				
				if isScrollableEnabled {
					if #available(iOS 14.0, *) {
						ScrollViewReader { scrollViewReader in
							ScrollView(.horizontal, showsIndicators: false) {
								itemList(scrollViewReader: scrollViewReader)
							}
						}
					} else { // Fallback on earlier versions
						ScrollView(.horizontal, showsIndicators: false) {
							itemList()
						}
					}
				} else {
					itemList()
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
		
		let itemSize: CGSize = self.appearance.itemSize
		customLabelView(labelView: titleView, font: font, color: color)
//			.frame(width: self.appearance.itemSize.width, height: self.appearance.itemSize.height)
			.if(itemSize.width == .infinity, contentTransformer: { view in
					view.frame(maxWidth: itemSize.width)
			})
				.if(itemSize.width != .infinity, contentTransformer: { view in
						view.frame(width: itemSize.width)
				})
				
					.if(itemSize.height == .infinity, contentTransformer: { view in
							view.frame(maxHeight: itemSize.height)
					})
						.if(itemSize.height != .infinity, contentTransformer: { view in
								view.frame(height: itemSize.height)
						})
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
	
	var currentSelectedItemRect: CGRect {
		self.allSegmentItemRectDataWithIndex[self.currentSelectedIndex].or(.zero)
	}
	var selectionViewWidth: CGFloat {
		if self.isScrollableEnabled.isFalse {
			if self.appearance.itemSize.width ==  CGFloat.infinity {
				return ( self.model.contentViewSize.width - (CGFloat(self.options.count) * self.appearance.itemSpacing) ) / CGFloat(self.options.count)
			} else {
				return self.appearance.itemSize.width
			}
		} else {
			return self.currentSelectedItemRect.size.width
		}
	}
	
	@ViewBuilder
	func currentSelectedItemBackgroundView() -> some View {
		switch self.selectionStyle {
		case .backgroundCapsule:
			Rectangle()
				.fill(self.appearance.selectedBackgroundColor)
				.frame(width: selectionViewWidth, height: self.appearance.itemSize.height)
				.apply(shape: self.appearance.selectedViewShape, color: self.appearance.selectedBorderColor, lineWidth: self.appearance.selectedBorderWidth)
				.offset(x: (allSegmentItemRectDataWithIndex[currentSelectedIndex]?.origin.x).or(0), y: 0)
				.animation(Animation.easeInOut(duration: 0.16))
		case .underline:
			Rectangle()
				.fill(self.appearance.selectedBackgroundColor)
				.apply(shape: self.appearance.selectedViewShape, color: self.appearance.selectedBorderColor, lineWidth: self.appearance.selectedBorderWidth)
				.frame(width: selectionViewWidth, height: self.selectionStyle.underlineHeight)
				.offset(x: self.currentSelectedItemRect.origin.x, y: 0)
//				.position(self.currentSelectedItemRect.origin)
				.animation(Animation.easeInOut(duration: 0.16))
		}
		
	}
}


//iOS14 and iOS13 conditional suppoort
extension NitrozenSegmentControl {
	@available(iOS 14.0, *)
	@ViewBuilder
	func itemList(scrollViewReader: ScrollViewProxy) -> some View {
		HStack(spacing: 0) {
			
			ForEach(0..<self.options.count, id: \.self) { i in
				let item = self.options[i]
				
				itemView(item: item, isSelected: item == self.selection)
					.nitrozen.frameAwareView(viewID: i, allViewRects: $allSegmentItemRectDataWithIndex, coordinateSpaceName: "parentZStack")
					.id(item)
					.contentShape(Rectangle()) //for user interaction in all the area
					.onTapGesture {
						withAnimation {
							if self.selection != item {
								self.selection = item
							}
							self.currentSelectedIndex = self.selectionIndex
							scrollViewReader.scrollTo(item, anchor: .center)
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
	
	
	@ViewBuilder
	func itemList() -> some View {
		HStack(spacing: 0) {
			
			ForEach(0..<self.options.count, id: \.self) { i in
				let item = self.options[i]
				
				itemView(item: item, isSelected: item == self.selection)
					.nitrozen.frameAwareView(viewID: i, allViewRects: $allSegmentItemRectDataWithIndex, coordinateSpaceName: "parentZStack")
					.id(item)
					.contentShape(Rectangle()) //for user interaction in all the area
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
}
