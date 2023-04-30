//
//  NitrozenEmptyView.swift
//  
//
//  Created by Keyur Patel on 20/04/23.
//

import SwiftUI

public struct NitrozenEmptyView<Actions>: View where Actions: View {
    public typealias ActionsBuilder = () -> Actions
    
    public enum CustomImageView {
        case nitrozen //default view
        case systemImage(name: String) //customized image from SFSymbol
        case assetImage(name: String) //customized image from .xcassets
        case custom(view: AnyView) // whole customized view
    }
    
    var topView: CustomImageView?
    var title: String
    var subTitle: String?
    var ctaButtonTitle: String?
    var appearance: NitrozenAppearance.EmptyView
    var onMainButtonClick: ElementTap?
    var actionsBuilder: ActionsBuilder?

    public init(
        topView: CustomImageView? = nil,
        title: String,
        subTitle: String? = nil,
        appearance: NitrozenAppearance.EmptyView? = nil,
        @ViewBuilder actions: @escaping ActionsBuilder) {
            self.topView = topView
            self.title = title
            self.subTitle = subTitle
            self.appearance = appearance.or(NitrozenAppearance.shared.emptyView)
            self.actionsBuilder = actions
        }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            self.topIconView()
            self.titleView()
            self.subTitleView()
            self.actionButtonView()
            self.actionsBuilder.convertToView {
                $0()
            }
        }
    }
    
    @ViewBuilder
    func topIconView() -> some View {
        self.topView.convertToView { topView in
            switch topView {
            case .systemImage(let imageName):
                Image(systemName: imageName)
                
            case .assetImage(let imageName):
                Image(imageName)
                
            case .custom(let customView):
                customView
                
            case .nitrozen:
                EmptyView()
            }
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
        self.ctaButtonTitle.convertToView { buttonTitle in
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

extension NitrozenEmptyView where Actions == Text {
    
    public init<S: StringProtocol>(
        topView: CustomImageView? = nil,
        title: S,
        subTitle: String? = nil,
        ctaButtonTitle: String? = nil,
        appearance: NitrozenAppearance.EmptyView? = nil,
        onMainButtonClick: ElementTap? = nil) {
            self.topView = topView
            self.title = (title as? String).or("")
            self.subTitle = subTitle
            self.ctaButtonTitle = ctaButtonTitle
            self.appearance = appearance.or(NitrozenAppearance.shared.emptyView)
            self.onMainButtonClick = onMainButtonClick
            self.actionsBuilder = nil
        }
    
}
