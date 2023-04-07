//
//  NitrozenAlert.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 07/04/23.
//

import SwiftUI

//MARK: NitrozenAlert
public struct NitrozenAlert<Actions>: View where Actions: View{
	
	//TODO: Hitendra - combine this common usage and change scope to align with Alert and actionSheet in future once other MR merged
	public enum CustomView {
		case nitrozen //default view
		case systemImage(name: String) //customized image from SFSymbol
		case assetImage(name: String) //customized image from .xcassets
		case custom(view: AnyView) // whole customized view
	}
	
	@Binding var isPresented: Bool
	var title: String?
	var subtitle: String?
	
	var topView: AnyView?
	var closeView: CustomView
	var actionsBuilder: () -> Actions
	
	var appearance: NitrozenAppearance.Alert
	
	public init(
		isPresented: Binding<Bool>,
		title: String? = nil, subtitle: String? = nil,
		topView: AnyView?, closeView: CustomView,
		@ViewBuilder actions: @escaping () -> Actions,
		appearance: NitrozenAppearance.Alert? = nil
	) {
		self._isPresented = isPresented
		self.title = title
		self.subtitle = subtitle
		
		self.topView = topView
		self.closeView = closeView
		self.actionsBuilder = actions
		
		self.appearance = appearance.or(NitrozenAppearance.shared.alert)
	}
	
	public var body: some View {
		if self.isPresented {
			alertView()
		}
	}
	
	func closeAlert(){
		self.isPresented = false
	}
	
	@ViewBuilder
	func alertView() -> some View {
		VStack(spacing: 0) {
			
			
			HStack {
				Spacer()
				switch self.closeView {
				case .systemImage(let imageName):
					Button {
						self.closeAlert()
					} label: {
						Image(systemName: imageName)
					}
					.tertiaryButton()
					.padding([.top, .trailing])
					
				case .assetImage(let imageName):
					Button {
						self.closeAlert()
					} label: {
						Image(imageName)
					}
					.tertiaryButton()
					.padding([.top, .trailing])
					
				case .custom(let customView):
					customView
					
				case .nitrozen:
					Button {
						self.closeAlert()
					} label: {
						Image(systemName: "xmark")
					}
					.tertiaryButton()
					.padding([.top, .trailing])
				}
			}

			self.topView.convertToView { topView in
				topView
					.padding(.top, 20)
					.padding(.bottom, 12)
			}
			
			
			
			
			Group {
				//"Great! Your bank account was added successfully"
				self.title.convertToView { title in
					Text(title)
						.foregroundColor(self.appearance.title.titleColor)
						.font(self.appearance.title.font)
						.padding(.bottom, 12)
				}
				
				//"You KYC verification is pending. Check your mailbox to complete the process."
				self.subtitle.convertToView { subtitle in
					Text(subtitle)
						.foregroundColor(NitrozenAppearance.shared.alert.subtitle.titleColor)
						.font(NitrozenAppearance.shared.alert.subtitle.font)
						.padding(.bottom, 32)
				}
				
				
				
					
			}
			.lineLimit(nil)
			.multilineTextAlignment(.center)
			.fixedSize(horizontal: false, vertical: true)
			.frame(maxWidth: .infinity, alignment: .center)
			
			self.actionsBuilder()
		}
		.padding()
		.background(Color(.systemBackground))
		.roundedCornerWithBorder(color: .clear, radius: 32, lineWidth: 0.0)
		.padding(.horizontal, 16)
	}
}
