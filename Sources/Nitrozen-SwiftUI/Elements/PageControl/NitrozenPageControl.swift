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
	
    public enum ViewUseCase {
        case pageControl, stapper
    }
    
	var pageCount: Int
	@Binding var currentPage: Int
	var deselectedView: CustomImageView
	var selectedView: CustomImageView
    var viewUseCase: ViewUseCase
	var appearance: NitrozenAppearance.PageControl
	
	public init(
		pageCount: Int,
		currentPage: Binding<Int>,
		selectedView: CustomImageView,
		deselectedView: CustomImageView,
        viewUseCase: ViewUseCase,
		appearance: NitrozenAppearance.PageControl? = nil
	) {
		self.pageCount = pageCount
		self._currentPage = currentPage
		self.deselectedView = deselectedView
		self.selectedView = selectedView
        self.viewUseCase = viewUseCase
		
		if let appearance = appearance {
			self.appearance = appearance
		}else {
			switch viewUseCase {
			case .stapper:
				self.appearance = NitrozenAppearance.shared.stapper
			case .pageControl:
				self.appearance = NitrozenAppearance.shared.pageControl
			}
		}
	}
	
	public var body: some View {
		pageControl()
	}
	
	@ViewBuilder func pageControl() -> some View {
		HStack(spacing: 0) {
			ForEach(0..<pageCount, id: \.self) { i in
                let isCurrent: Bool = i == self.currentPage - 1
				
				if isCurrent {
					selectedViewWithModifier()
                    
                } else if self.viewUseCase == .stapper && i < self.currentPage{
                    selectedViewWithModifier()
                    
                }  else {
                    deSelectedViewWithModifier(index: i)
                    
				}
                
                if i < self.pageCount {
                    Spacer()
                        .if(self.appearance.spacing == .infinity, contentTransformer: { view in
                                view.frame(maxWidth: self.appearance.spacing)
                        })
                            .if(self.appearance.spacing != .infinity, contentTransformer: { view in
                                    view.frame(width: self.appearance.spacing)
                            })
                }
			}
		}
	}
	
    @ViewBuilder
    func selectedViewWithModifier() -> some View {
        customSelectedView()
            .if(self.appearance.selectedSize.width == .infinity, contentTransformer: { view in
                    view.frame(maxWidth: self.appearance.selectedSize.width)
            })
                .if(self.appearance.selectedSize.width != .infinity, contentTransformer: { view in
                        view.frame(width: self.appearance.selectedSize.width)
                })
                
                    .if(self.appearance.selectedSize.height == .infinity, contentTransformer: { view in
                            view.frame(maxHeight: self.appearance.selectedSize.height)
                    })
                        .if(self.appearance.selectedSize.height != .infinity, contentTransformer: { view in
                                view.frame(height: self.appearance.selectedSize.height)
                        })
            .foregroundColor(self.appearance.selectedColor)
            .apply(shape: self.appearance.selectedViewShape, color: self.appearance.selectedBorderColor, lineWidth: self.appearance.selectedBorderWidth)
            .animation(.default.speed(50.0))
            .zIndex(10)
    }
    
    @ViewBuilder
    func deSelectedViewWithModifier(index: Int) -> some View {
        customDeSelectedView()
            .scaledToFill()
            .if(self.appearance.deSelectedSize.width == .infinity, contentTransformer: { view in
                    view.frame(maxWidth: self.appearance.deSelectedSize.width)
            })
                .if(self.appearance.deSelectedSize.width != .infinity, contentTransformer: { view in
                        view.frame(width: self.appearance.deSelectedSize.width)
                })
                
                    .if(self.appearance.deSelectedSize.height == .infinity, contentTransformer: { view in
                            view.frame(maxHeight: self.appearance.deSelectedSize.height)
                    })
                        .if(self.appearance.deSelectedSize.height != .infinity, contentTransformer: { view in
                                view.frame(height: self.appearance.deSelectedSize.height)
                        })
            .foregroundColor(self.appearance.deselectedColor)
            .apply(shape: self.appearance.deselectedViewShape, color: self.appearance.deselectedBorderColor, lineWidth: self.appearance.deselectedBorderWidth)
            .animation(.default.speed(50.0))
            .transition(.move(edge: index < self.currentPage ? .trailing : .leading))
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
