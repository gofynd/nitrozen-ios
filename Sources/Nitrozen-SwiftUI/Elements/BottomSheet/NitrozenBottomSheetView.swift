//
//  NitrozenBottomSheetView.swift
//
//
//  Created by Shadhiq on 25/01/24.
//

import SwiftUI

public struct NitrozenBottomSheetView: View {
    var title: String
    var subTitle: String?
    @Binding var isPresented: Bool
    var appearance: NitrozenAppearance.ActionSheet = NitrozenAppearance.shared.actionSheet
    let closeView: CustomView
    var content: () -> any View
    
    public enum CustomView {
        case nitrozen //default view
        case systemImage(name: String) //customized image from SFSymbol
        case assetImage(name: String) //customized image from .xcassets
        case custom(view: AnyView) // whole customized view
    }
    
    public init(title: String, subTitle: String? = nil, isPresented: Binding<Bool>, content: @escaping () -> any View, appearance: NitrozenAppearance.ActionSheet, closeView: CustomView) {
        self.title = title
        self.subTitle = subTitle
        self._isPresented = isPresented
        self.content = content
        self.appearance = appearance
        self.closeView = closeView
    }

    public var body: some View {
        ZStack(alignment: .bottom) {
            if (isPresented) {
                Color.black
                    .opacity(0.65)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        isPresented.toggle()
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .edgesIgnoringSafeArea(.all)
        .animation(.default, value: isPresented)
        
        ZStack {
            if isPresented {
                VStack(alignment: .leading, spacing: 24) {
                    titleView
                    subTitleLabel
                    AnyView(content())
                }
                .padding(16)
                .padding(.top, 4)
                    .transition(.move(edge: .bottom))
                    .background(
                        Color.white
                    )
                    .cornerRadius(24)
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .edgesIgnoringSafeArea(.all)
        .animation(.default, value: isPresented)
        .zIndex(1)
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
                    self.isPresented.toggle()
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

    @ViewBuilder
    func systemImageButton(imageName: String) -> some View {
        Button {
            self.isPresented.toggle()
        } label: {
            Image(systemName: imageName)
        }
        .foregroundColor(self.appearance.closeButtonColor)
    }
}
