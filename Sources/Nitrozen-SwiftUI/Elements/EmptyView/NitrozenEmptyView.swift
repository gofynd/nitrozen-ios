//
//  NitrozenEmptyView.swift
//  
//
//  Created by Keyur Patel on 20/04/23.
//

import SwiftUI

public struct NitrozenEmptyView<Actions>: View {
    
    var icon: Image?
    var title: String?
    var subTitle: String?
    var buttonTitle: String?
    var appearance: NitrozenAppearance.EmptyView
    var actionsBuilder: () -> Actions
    
    public init(
        icon: Image? = nil,
        title: String? = nil,
        subTitle: String? = nil,
        buttonTitle: String? = nil,
        appearance: NitrozenAppearance.EmptyView? = nil,
        @ViewBuilder actions: @escaping () -> Actions) {
            self.icon = icon
            self.title = title
            self.subTitle = subTitle
            self.buttonTitle = buttonTitle
            self.appearance = appearance.or(NitrozenAppearance.shared.emptyView)
            self.actionsBuilder = actions
        }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            icon.convertToView {
                $0
            }
            titleView()
            subTitleView()
        }
    }
    
    @ViewBuilder func titleView() -> some View {
        self.title.convertToView { title in
            Text(title)
                .foregroundColor(appearance.titleStyle.titleColor)
                .font(appearance.titleStyle.font)
                .apply(padding: appearance.titlePadding)
        }
    }
    
    @ViewBuilder func subTitleView() -> some View {
        self.subTitle.convertToView { subTitle in
            Text(subTitle)
                .foregroundColor(appearance.subTitleStyle.titleColor)
                .font(appearance.subTitleStyle.font)
                .apply(padding: appearance.subTitlePaddding)
        }
    }
    
    @ViewBuilder func actionButtonView() -> some View {
        self.buttonTitle.convertToView { buttonTitle in
            Button {
                
            } label: {
                Text(buttonTitle)
            }
            .pri

            Text(subTitle)
                .foregroundColor(appearance.subTitleStyle.titleColor)
                .font(appearance.subTitleStyle.font)
                .apply(padding: appearance.subTitlePaddding)
        }
    }
    
}
