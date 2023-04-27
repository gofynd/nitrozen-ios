//
//  StepperView+Appearance.swift
//  
//
//  Created by Rushang Prajapati on 24/04/23.
//

import Foundation

public extension NitrozenAppearance {
    class StepperView {
        
        public enum CustomView {
            case systemImage(name: String) //customized image from SFSymbol
            case assetImage(name: String) //customized image from .xcassets
        }

        public var inputTitle: NitrozenAppearance.TextLabel
        public var actionButton: NitrozenAppearance.Button
        public var inputField: NitrozenAppearance.TextField
        var inputFieldSize: CGSize
        var actionButtonSize: CGSize
        var decrementButton: CustomView
        var incrementButton: CustomView
        var viewShpae:ViewShape

        init(
            inputTitle: NitrozenAppearance.TextLabel,
            actionButton:NitrozenAppearance.Button,
            inputFieldSize:CGSize,
            actionButtonSize: CGSize,
            decrementButton: CustomView,
            incrementButton: CustomView,
            viewShape:ViewShape = .circle,
            inputField: NitrozenAppearance.TextField
            
        ) {
            self.inputTitle = inputTitle
            self.actionButton = actionButton
            self.inputFieldSize = inputFieldSize
            self.actionButtonSize = actionButtonSize
            self.decrementButton = decrementButton
            self.incrementButton = incrementButton
            self.viewShpae = viewShape
            self.inputField = inputField
        }
        
    }
}

public extension NitrozenAppearance.StepperView {
    @discardableResult
    func inputTitle(_ inputTitle: NitrozenAppearance.TextLabel) -> Self { self.inputTitle = inputTitle; return self }
    
    @discardableResult
    func actionButton(_ actionButton: NitrozenAppearance.Button) -> Self { self.actionButton = actionButton; return self }

    @discardableResult
    func inputField(_ inputField: NitrozenAppearance.TextField) -> Self { self.inputField = inputField; return self }

    @discardableResult
    func inputFieldSize(_ inputFieldSize: CGSize) -> Self { self.inputFieldSize = inputFieldSize; return self }

    @discardableResult
    func actionButtonSize(_ actionButtonSize: CGSize) -> Self { self.actionButtonSize = actionButtonSize; return self }

    @discardableResult
    func decrementButton(_ decrementButton: CustomView) -> Self { self.decrementButton = decrementButton; return self }

    @discardableResult
    func incrementButton(_ incrementButton: CustomView) -> Self { self.incrementButton = incrementButton; return self }

    @discardableResult
    func viewShpae(_ viewShpae: ViewShape) -> Self { self.viewShpae = viewShpae; return self }


}

//MARK: Copy Support
public extension NitrozenAppearance.StepperView {
    var copy: NitrozenAppearance.StepperView {
        .init(
            inputTitle: self.inputTitle.copy,
            actionButton: self.actionButton.copy,
            inputFieldSize: self.inputFieldSize,
            actionButtonSize: self.actionButtonSize,
            decrementButton: self.decrementButton,
            incrementButton: self.incrementButton,
            viewShape: self.viewShpae,
            inputField: self.inputField.copy
        )
    }
}
