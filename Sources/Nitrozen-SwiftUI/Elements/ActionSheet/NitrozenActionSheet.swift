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
	
	public init(
		title:String,
		subTitle:String? = nil,
		isShowing: Binding<Bool>,
		@ViewBuilder content: () -> Content,
		appearance: NitrozenAppearance.ActionSheet? = nil
		
	) {
		self.content = content()
		self.title = title
		self._isShowing = isShowing
		self.appearance = appearance.or(NitrozenAppearance.shared.actionSheet)
		self.subTitle = subTitle
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
					titleLabel
					subTitleLabel
					content
						.padding(.horizontal, 16)
					Spacer().frame(height: 30)
				}
			}
			.background(Color.white)
			.cornerRadius(20)
		}
	}
	
	public var titleLabel: some View {
		HStack(alignment: .top){
			Text(title)
				.font(self.appearance.title.font)
				.foregroundColor(self.appearance.title.titleColor)

			Spacer()
			dismissButton
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

	
	public var dismissButton : some View{
		Button {
			self.isShowing.toggle()
		} label: {
			Image(systemName: "multiply")
				.frame(width: 16, height: 16)
		}

	}
	
}
