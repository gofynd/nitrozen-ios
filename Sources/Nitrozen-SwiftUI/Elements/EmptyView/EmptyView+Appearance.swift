//
//  EmptyView+Appearance.swift
//  
//
//  Created by Keyur Patel on 20/04/23.
//

import SwiftUI

public extension NitrozenAppearance {
    
    class EmptyView {
        
        var titleStyle: TextLabel
        var subTitleStyle: TextLabel
        var titlePadding: ViewPadding
        var subTitlePaddding: ViewPadding
        var buttonPadding: ViewPadding
        
        init(
            titleStyle: TextLabel,
            subTitleStyle: TextLabel,
            titlePadding: ViewPadding,
            subTitlePaddding: ViewPadding,
            buttonPadding: ViewPadding) {
                self.titleStyle = titleStyle
                self.subTitleStyle = subTitleStyle
                self.titlePadding = titlePadding
                self.subTitlePaddding = subTitlePaddding
                self.buttonPadding = buttonPadding
            }
        
    }
    
}

extension NitrozenAppearance.EmptyView {
    
    @discardableResult
    func titleStyle(_ titleStyle: NitrozenAppearance.TextLabel) -> Self { self.titleStyle = titleStyle; return self }
    
    @discardableResult
    func subTitleStyle(_ subTitleStyle: NitrozenAppearance.TextLabel) -> Self { self.subTitleStyle = subTitleStyle; return self }
    
    @discardableResult
    func titlePadding(_ titlePadding: ViewPadding) -> Self { self.titlePadding = titlePadding; return self }
    
    @discardableResult
    func subTitlePaddding(_ subTitlePaddding: ViewPadding) -> Self { self.subTitlePaddding = subTitlePaddding; return self }
    
    @discardableResult
    func buttonPadding(_ buttonPadding: ViewPadding) -> Self { self.buttonPadding = buttonPadding; return self }
    
}

//MARK: Copy Support
public extension NitrozenAppearance.EmptyView {
    var copy: NitrozenAppearance.EmptyView {
        .init(
            titleStyle: self.titleStyle,
            subTitleStyle: self.subTitleStyle,
            titlePadding: self.titlePadding,
            subTitlePaddding: self.subTitlePaddding,
            buttonPadding: self.buttonPadding
        )
    }
}

