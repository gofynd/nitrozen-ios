//
//  Radio+Appearance.swift
//  
//
//  Created by Rushang Prajapati on 05/04/23.
//

import Foundation
import SwiftUI

public extension NitrozenAppearance {
    
    class RadioButton {
        //TODO: - Change deSelectedBorderColor to deSelectedBorderColor
        var selectedBorderColor:SystemColor
        var deSelectedBorderColor:SystemColor
        
        var selectedBorderWidth:CGFloat
        var deSelectedBorderWidth:CGFloat
        
        var selectedTitle:TextLabel
        var deSelectedTitle:TextLabel

        var selectedSubTitle:TextLabel
        var deSelectedSubTitle:TextLabel
        
        var viewPadding: ViewPadding
                
        init(selectedBorderColor: SystemColor, deSelectedBorderColor: SystemColor, selectedBorderWidth: CGFloat, deSelectedBorderWidth: CGFloat, selectedTitle: TextLabel, deSelectedTitle: TextLabel, selectedSubTitle: TextLabel, deSelectedSubTitle: TextLabel, viewPadding: ViewPadding = .zero) {
            self.selectedBorderColor = selectedBorderColor
            self.deSelectedBorderColor = deSelectedBorderColor
            self.selectedBorderWidth = selectedBorderWidth
            self.deSelectedBorderWidth = deSelectedBorderWidth
            self.selectedTitle = selectedTitle
            self.deSelectedTitle = deSelectedTitle
            self.selectedSubTitle = selectedSubTitle
            self.deSelectedSubTitle = deSelectedSubTitle
            self.viewPadding = viewPadding
        }
        
    }
    
}

public extension NitrozenAppearance.RadioButton {
    
    @discardableResult
    func selectedBorderColor(_ selectedBorderColor: SystemColor) -> Self { self.selectedBorderColor = selectedBorderColor; return self }

    func deSelectedBorderColor(_ deSelectedBorderColor: SystemColor) -> Self { self.deSelectedBorderColor = deSelectedBorderColor; return self }
    
    @discardableResult
    func selectedBorderWidth(_ selectedBorderWidth: CGFloat) -> Self { self.selectedBorderWidth = selectedBorderWidth; return self }

    @discardableResult
    func deSelectedBorderWidth(_ deSelectedBorderWidth: CGFloat) -> Self { self.deSelectedBorderWidth = deSelectedBorderWidth; return self }
    
    @discardableResult
    func selectedTitle(_ selectedTitle: NitrozenAppearance.TextLabel) -> Self { self.selectedTitle = selectedTitle; return self }

    @discardableResult
    func deSelectedTitle(_ deSelectedTitle: NitrozenAppearance.TextLabel) -> Self { self.deSelectedTitle = deSelectedTitle; return self }

    @discardableResult
    func selectedSubTitle(_ selectedSubTitle: NitrozenAppearance.TextLabel) -> Self { self.selectedSubTitle = selectedSubTitle; return self }

    @discardableResult
    func deSelectedSubTitle(_ deSelectedSubTitle: NitrozenAppearance.TextLabel) -> Self { self.deSelectedSubTitle = deSelectedSubTitle; return self }
    
    @discardableResult
    func viewPadding(_ viewPadding: ViewPadding) -> Self { self.viewPadding = viewPadding; return self }
    
}

//MARK: Copy Support
public extension NitrozenAppearance.RadioButton {
    var copy: NitrozenAppearance.RadioButton {
        .init(
            selectedBorderColor: self.selectedBorderColor,
            deSelectedBorderColor: self.deSelectedBorderColor,
            selectedBorderWidth: self.selectedBorderWidth,
            deSelectedBorderWidth: self.deSelectedBorderWidth,
            selectedTitle: self.selectedTitle,
            deSelectedTitle: self.deSelectedTitle,
            selectedSubTitle: self.selectedSubTitle,
            deSelectedSubTitle: self.deSelectedSubTitle,
            viewPadding: self.viewPadding
        )
    }
}
