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
    var subtitle: String?
    var buttonTitle: String?
    var appearance: NitrozenAppearance.EmptyView
    var actionsBuilder: () -> Actions
    
    public init(
        icon: Image? = nil,
        title: String? = nil,
        subtitle: String? = nil,
        buttonTitle: String? = nil,
        appearance: NitrozenAppearance.EmptyView? = nil,
        @ViewBuilder actions: @escaping () -> Actions) {
            self.icon = icon
            self.title = title
            self.subtitle = subtitle
            self.buttonTitle = buttonTitle
            self.appearance = appearance.or(NitrozenAppearance.shared.emptyView)
            self.actionsBuilder = actions
        }
    
    public var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
