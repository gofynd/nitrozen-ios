//
//  NitrozenPageControl.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 10/04/23.
//

import SwiftUI

//MARK: PageControlView
public struct NitrozenPageControl: View {
	
	//TODO: Hitendra - combine this common usage and change scope to align with Alert and actionSheet in future once other MR merged
	public enum CustomImageView {
		case nitrozen //default view
		case systemImage(name: String) //customized image from SFSymbol
		case assetImage(name: String) //customized image from .xcassets
		case custom(view: AnyView) // whole customized view
	}
	
	var pageCount: Int
	@Binding var currentPage: Int
	var deselectedView: CustomImageView
	var selectedView: CustomImageView
	
	var appearance: NitrozenAppearance.PageControl
	
	public init(
		pageCount: Int,
		currentPage: Binding<Int>,
		selectedView: CustomImageView,
		deselectedView: CustomImageView,
		appearance: NitrozenAppearance.PageControl? = nil
	) {
		self.pageCount = pageCount
		self._currentPage = currentPage
		self.deselectedView = deselectedView
		self.selectedView = selectedView
		self.appearance = appearance.or(NitrozenAppearance.shared.pageControl)
	}
	
	public var body: some View {
		pageControl()
	}
	
	@ViewBuilder func pageControl() -> some View {
		HStack(spacing: self.appearance.spacing) {
			ForEach(0...pageCount, id: \.self) { i in
				let isCurrent: Bool = i == self.currentPage
				
				if isCurrent {
					customSelectedView()
						.frame(width: self.appearance.selectedSize.width)
						.frame(height: self.appearance.selectedSize.height)
						.foregroundColor(self.appearance.selectedColor)
						.apply(shape: self.appearance.selectedViewShape, color: self.appearance.selectedBorderColor, lineWidth: self.appearance.selectedBorderWidth)
						.animation(.default.speed(50.0))
						.zIndex(10)
				} else {
					customDeSelectedView()
						.scaledToFill()
						.frame(width: self.appearance.deSelectedSize.width)
						.frame(height: self.appearance.deSelectedSize.height)
						.foregroundColor(self.appearance.deselectedColor)
						.apply(shape: self.appearance.deselectedViewShape, color: self.appearance.deselectedBorderColor, lineWidth: self.appearance.deselectedBorderWidth)
						.animation(.default.speed(50.0))
						.transition(.move(edge: i < self.currentPage ? .trailing : .leading))
				}
			}
		}
	}
	
	@ViewBuilder
	func customSelectedView() -> some View {
		switch self.selectedView {
		case .systemImage(let imageName):
			Image(systemName: imageName)
				.resizable()
			
		case .assetImage(let imageName):
			Image(imageName)
				.resizable()
			
		case .custom(let customView):
			customView
			
		case .nitrozen:
			Rectangle()
		}
	}
	
	@ViewBuilder
	func customDeSelectedView() -> some View {
		switch self.deselectedView {
		case .systemImage(let imageName):
			Image(systemName: imageName)
				.resizable()
			
		case .assetImage(let imageName):
			Image(imageName)
				.resizable()
			
		case .custom(let customView):
			customView
			
		case .nitrozen:
			Rectangle()
		}
	}
}
