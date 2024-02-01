//
//  NitrozenAlert.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 07/04/23.
//

import SwiftUI

//MARK: NitrozenAlert
public struct NitrozenAlert: View {
	
	//TODO: Hitendra - combine this common usage and change scope to align with Alert and actionSheet in future once other MR merged
	public enum CustomImageView {
		case nitrozen //default view
		case systemImage(name: String) //customized image from SFSymbol
		case assetImage(name: String) //customized image from .xcassets
		case custom(view: AnyView) // whole customized view
	}
	
	@Binding var isPresented: Bool
	var title: String?
	var subtitle: String?
	
	var topView: (any View)?
	var closeView: CustomImageView?
	var actionsBuilder: () -> any View
	
	var appearance: NitrozenAppearance.Alert
	
	public init(
		isPresented: Binding<Bool>,
		title: String? = nil, subtitle: String? = nil,
		topView: (any View)? = nil, closeView: CustomImageView? = nil,
		@ViewBuilder actions: @escaping () -> any View,
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
        ZStack(alignment: .center) {
            if (isPresented) {
                Color.black
                    .opacity(0.65)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        isPresented.toggle()
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .edgesIgnoringSafeArea(.all)
        .animation(.easeInOut, value: isPresented)
        
        ZStack(alignment: .center) {
            alertView()
        }
        .offset(y: isPresented ? 0 : UIScreen.main.bounds.height)
        .animation(.easeInOut, value: isPresented)
        .zIndex(1)
	}
	
	func closeAlert(){
		self.isPresented = false
	}
	
	@ViewBuilder
	func alertView() -> some View {
		VStack(spacing: 0) {
            self.closeView.convertToView { closeView in
                HStack {
                    Spacer()
                    
                    switch closeView {
                    case .systemImage(let imageName):
                        systemImageButton(imageName: imageName)
                        
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
                        systemImageButton(imageName: "xmark")
                    }
                }
            }

			self.topView.convertToView { topView in
				AnyView(topView)
                    .apply(padding: appearance.topImagePadding)
			}
			
			Group {
				self.title.convertToView { title in
					Text(title)
						.foregroundColor(self.appearance.title.titleColor)
						.font(self.appearance.title.font)
                        .apply(padding: appearance.titlePadding)
				}
				self.subtitle.convertToView { subtitle in
					Text(subtitle)
						.foregroundColor(NitrozenAppearance.shared.alert.subtitle.titleColor)
						.font(NitrozenAppearance.shared.alert.subtitle.font)
                        .apply(padding: appearance.subTitlePaddding)
				}
			}
			.lineLimit(nil)
			.multilineTextAlignment(.center)
			.fixedSize(horizontal: false, vertical: true)
			.frame(maxWidth: .infinity, alignment: .center)
			
			AnyView(self.actionsBuilder())
		}
		.padding()
		.background(Color(.systemBackground))
		.nitrozen.roundedCornerWithBorder(color: .clear, radius: 32, lineWidth: 0.0)
		.padding(.horizontal, 16)
	}
	
	@ViewBuilder
	func systemImageButton(imageName: String) -> some View {
		Button {
			self.closeAlert()
		} label: {
			Image(systemName: imageName)
		}
		.tertiaryButton()
		.padding([.top, .trailing])
	}
}
