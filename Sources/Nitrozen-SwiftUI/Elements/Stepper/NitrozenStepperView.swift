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
    var range: Range<Int>
    var step:Int
    var itemSpacing: CGFloat
    var maxInputValue:Int
    var minInputValue:Int
    
    public init(
        inputValue: Binding<String>,
        appearance: NitrozenAppearance.StepperView? = nil,
        range:Range<Int>,
        step:Int,
        itemSpacing:CGFloat
    ) {
        self._inputValue = inputValue
        self.appearance = appearance.or(NitrozenAppearance.shared.stepperView)
        self.range = range
        self.step = step
        self.itemSpacing = itemSpacing
        self.maxInputValue = self.range.upperBound - 1
        self.minInputValue = self.range.lowerBound
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
                if Int(inputValue).or(0) > maxInputValue{
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
        let isButtonDisable = (maxInputValue == Int(inputValue).or(0))
        
        let borderColor = isButtonDisable ?
        appearance.actionButton.borderColorDisabled : appearance.actionButton.borderColor
                
        let titleColor = isButtonDisable ?
        appearance.actionButton.titleColorDisabled : appearance.actionButton.titleColor

        let backGroundColor = isButtonDisable ?
        appearance.actionButton.backgroundColorDisabled : appearance.actionButton.backgroundColor
        
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
        .foregroundColor(titleColor)
        .disabled(isButtonDisable)
        .background(backGroundColor)
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
        let isButtonDisable = minInputValue == Int(inputValue).or(0)

        let borderColor = isButtonDisable ?
        appearance.actionButton.borderColorDisabled : appearance.actionButton.borderColor
        
        let titleColor = isButtonDisable ?
        appearance.actionButton.titleColorDisabled : appearance.actionButton.titleColor

        let backGroundColor = isButtonDisable ?
        appearance.actionButton.backgroundColorDisabled : appearance.actionButton.backgroundColor
        
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
        .foregroundColor(titleColor)
        .background(backGroundColor)
        .disabled(isButtonDisable)
        .apply(
            shape: appearance.viewShpae,
            color:borderColor,
            lineWidth: appearance.actionButton.borderWidth
        )
    }
    
    func increment(){
        if Int(inputValue).or(0) < maxInputValue{
            var value = Int(inputValue).or(0)
            value += step
            if value > self.maxInputValue {
                inputValue = min(value, self.maxInputValue).description
            }
            else{
                inputValue = "\(value)"
            }
            
        }
        
    }
    
    func decrement(){
        if minInputValue < Int(inputValue).or(0){
            var value = Int(inputValue).or(0)
            value -= step
            inputValue = "\(value)"
            if Int(inputValue) ?? 00 < self.minInputValue {
                inputValue = max(Int(inputValue) ?? 00, self.minInputValue).description
            }
        }
    }
    
}
