//
//  NitrozenStepperView.swift
//  
//
//  Created by Rushang Prajapati on 24/04/23.
//

import Foundation
import SwiftUI

public struct NitrozenStepperView: View {
    
    @Binding var inputValue:String
    var appearance: NitrozenAppearance.StepperView
    var maxNumber:Int
    var itemSpacing: CGFloat
    
    public init(
        totalQuntity: Binding<String>,
        appearance: NitrozenAppearance.StepperView? = nil,
        maxNumber:Int,
        itemSpacing:CGFloat
    ) {
        self._inputValue = totalQuntity
        self.appearance = appearance.or(NitrozenAppearance.shared.stepperView)
        self.maxNumber = maxNumber
        self.itemSpacing = itemSpacing
    }
    
    public var body: some View {
        HStack(spacing: self.itemSpacing){
            decrementAction()
            inputTextfield()
            incrementAction()
        }
    }
    
    @ViewBuilder
    func inputTextfield() -> some View{
        TextField("", text: $inputValue)
            .background(appearance.inputField.backgroundColor)
            .multilineTextAlignment(.center)
            .apply(padding: appearance.inputField.borderPadding)
            .frame(
                minWidth:self.appearance.inputFieldSize.width,
                minHeight: self.appearance.inputFieldSize.height
            )
            .fixedSize(horizontal:true, vertical: false)
            .nitrozen.roundedCornerWithBorder(
                color: self.appearance.inputField.borderColor,
                radius: self.appearance.inputField.borderRadius,
                lineWidth: self.appearance.inputField.borderWidth
            )
            .keyboardType(.numberPad)
            .onReceive(inputValue.publisher) { text in
                if Int(inputValue).or(0) > maxNumber{
                    inputValue.remove(at: inputValue.index(before: inputValue.endIndex))
                }
            }
    }
    
    @ViewBuilder
    func incrementAction() -> some View{
        switch appearance.incrementButton{
        case .systemImage(let imageName):
            incremenButton(imageType: .systemImage(name: imageName))
        case .assetImage(let imageName):
            incremenButton(imageType: .assetImage(name: imageName))
        }
    }
    
    @ViewBuilder
    func incremenButton(imageType:NitrozenAppearance.StepperView.CustomView) -> some View{
        let borderColor = (maxNumber == Int(inputValue).or(0)) ?
        appearance.actionButton.borderColorDisabled : appearance.actionButton.borderColor
        
        Button(action: {
            increment()
        }) {
            Group{
                switch imageType {
                case .systemImage(let name):
                    Image(systemName: name)
                case .assetImage(let name):
                    Image(name)
                }
            }
            .frame(
                width: appearance.actionButtonSize.height,
                height: appearance.actionButtonSize.height
            )
        }
        .foregroundColor(appearance.actionButton.titleColor)
        .disabled(maxNumber == Int(inputValue).or(0))
        .background(appearance.actionButton.backgroundColor)
        .apply(
            shape: appearance.viewShpae,
            color:borderColor,
            lineWidth: appearance.actionButton.borderWidth
        )
        
    }
    
    @ViewBuilder
    func decrementAction() -> some View{
        switch appearance.decrementButton {
        case .systemImage(let imageName):
            decrementButton(imageType: .systemImage(name: imageName))
        case .assetImage(let imageName):
            decrementButton(imageType: .assetImage(name: imageName))
        }
    }
    
    @ViewBuilder
    func decrementButton(imageType:NitrozenAppearance.StepperView.CustomView) -> some View{
        let borderColor = (0 == Int(inputValue).or(0)) ?
        appearance.actionButton.borderColorDisabled : appearance.actionButton.borderColor
        
        Button(action: {
            decrement()
        }) {
            Group{
                switch imageType {
                case .systemImage(let name):
                    Image(systemName: name)
                case .assetImage(let name):
                    Image(name)
                }
            }
            .frame(
                width: appearance.actionButtonSize.height,
                height: appearance.actionButtonSize.height
            )
        }
        .foregroundColor(appearance.actionButton.titleColor)
        .background(appearance.actionButton.backgroundColor)
        .disabled(0 == Int(inputValue).or(0))
        .apply(
            shape: appearance.viewShpae,
            color:borderColor,
            lineWidth: appearance.actionButton.borderWidth
        )
    }
    
    func increment(){
        if Int(inputValue).or(0) < maxNumber{
            var value = Int(inputValue).or(0)
            value += 1
            inputValue = "\(value)"
        }
        
    }
    
    func decrement(){
        if 0 < Int(inputValue).or(0){
            var value = Int(inputValue).or(0)
            value -= 1
            inputValue = "\(value)"
        }
        
    }
    
}
