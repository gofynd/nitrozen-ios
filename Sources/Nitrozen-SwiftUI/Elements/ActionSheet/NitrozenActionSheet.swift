//
//  NitrozenActionSheet.swift
//  
//
//  Created by Rushang Prajapati on 06/04/23.
//

import Foundation
import SwiftUI

public struct NitrozenActionSheet<Content: View>: View {
	
	var title:String
	var subTitle:String?
	@Binding var isShowing: Bool
	let content: Content
	var appearance: NitrozenAppearance.ActionSheet
	let closeView: CustomView
	
	public enum CustomView {
		case nitrozen //default view
		case systemImage(name: String) //customized image from SFSymbol
		case assetImage(name: String) //customized image from .xcassets
		case custom(view: AnyView) // whole customized view
	}
	
	public init(
		title:String,
		subTitle:String? = nil,
		isShowing: Binding<Bool>,
		closeView:CustomView,
		@ViewBuilder content: () -> Content,
		appearance: NitrozenAppearance.ActionSheet? = nil
		
	) {
		self.content = content()
		self.title = title
		self._isShowing = isShowing
		self.appearance = appearance.or(NitrozenAppearance.shared.actionSheet)
		self.subTitle = subTitle
		self.closeView = closeView
	}
	
	public var body: some View {
		if isShowing {
			sheetView
		}
	}
	
	public var sheetView: some View {
		VStack{
			Spacer()
			VStack(alignment: .leading, spacing: 0){
				VStack(alignment: .leading){
					titleView
					subTitleLabel
					content
						.padding(.horizontal, 16)
					Spacer().frame(height: 30)
				}
			}
			.background(Color.white)
			.cornerRadius(20, corners: [.topLeft, .topRight])
		}
	}
	
	public var titleView: some View {
		HStack(alignment: .center){
			Text(title)
				.font(self.appearance.title.font)
				.foregroundColor(self.appearance.title.titleColor)
			
			Spacer()
			switch self.closeView {
			case .systemImage(let imageName):
				systemImageButton(imageName: imageName)
			case .assetImage(let imageName):
				Button {
					self.closeAlert()
				} label: {
					Image(imageName)
				}
				.foregroundColor(self.appearance.closeButtonColor)
			case .custom(let customView):
				customView
				
			case .nitrozen:
				systemImageButton(imageName: "xmark")
			}

		}
		.padding(.top, 20)
		.padding(.horizontal, 16)
		
	}
	
	public var subTitleLabel: some View {
		self.subTitle.convertToView { text in
			Text(text)
				.font(self.appearance.subTitle.font)
				.foregroundColor(self.appearance.subTitle.titleColor)
				.padding(.horizontal, 16)
		}
		
	}
		
	func closeAlert(){
		self.isShowing.toggle()
	}
	
	@ViewBuilder
	func systemImageButton(imageName: String) -> some View {
		Button {
			self.closeAlert()
		} label: {
			Image(systemName: imageName)
		}
		.foregroundColor(self.appearance.closeButtonColor)
	}
	
	
}


extension View {
	func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
		clipShape( RoundedCorner(radius: radius, corners: corners) )
	}
}

struct RoundedCorner: Shape {

	var radius: CGFloat = .infinity
	var corners: UIRectCorner = .allCorners

	func path(in rect: CGRect) -> Path {
		let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		return Path(path.cgPath)
	}
}
