//
//  NitrozenEmptyView.swift
//  
//
//  Created by Keyur Patel on 20/04/23.
//

import SwiftUI

public struct NitrozenEmptyView: View {
    
    var topView: AnyView?
    var title: String
    var subTitle: String?
    var buttonTitle: String?
    var appearance: NitrozenAppearance.EmptyView
    var onMainButtonClick: ElementTap?
    
    public init(
        topView: AnyView? = nil,
        title: String,
        subTitle: String? = nil,
        buttonTitle: String? = nil,
        appearance: NitrozenAppearance.EmptyView? = nil,
        onMainButtonClick: ElementTap? = nil) {
            self.topView = topView
            self.title = title
            self.subTitle = subTitle
            self.buttonTitle = buttonTitle
            self.appearance = appearance.or(NitrozenAppearance.shared.emptyView)
            self.onMainButtonClick = onMainButtonClick
        }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            self.topView.convertToView {
                $0
            }
            titleView()
            subTitleView()
            actionButtonView()
        }
    }
    
    @ViewBuilder func titleView() -> some View {
        Text(self.title)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(appearance.titleStyle.titleColor)
                .font(appearance.titleStyle.font)
                .multilineTextAlignment(.center)
                .apply(padding: appearance.titlePadding)
    }
    
    @ViewBuilder func subTitleView() -> some View {
        self.subTitle.convertToView { subTitle in
            Text(subTitle)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(appearance.subTitleStyle.titleColor)
                .font(appearance.subTitleStyle.font)
                .multilineTextAlignment(.center)
                .apply(padding: appearance.subTitlePaddding)
        }
    }
    
    @ViewBuilder func actionButtonView() -> some View {
        self.buttonTitle.convertToView { buttonTitle in
            Button {
                self.onMainButtonClick?()
            } label: {
                Text(buttonTitle)
            }
            .primaryButton()
            .apply(padding: appearance.buttonPadding)
        }
    }
    
}
