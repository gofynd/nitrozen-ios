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
    var intInputValue:Int {
        return Int($inputValue.wrappedValue) ?? 0
    }
    
    public init(
        inputValue: Binding<String>,
        range:Range<Int>,
        step:Int,
        itemSpacing:CGFloat,
        appearance: NitrozenAppearance.StepperView? = nil

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
			decrementActionButton()
            inputTextfield()
            incrementActionButton()
        }
    }
    
    @ViewBuilder
    func inputTextfield() -> some View{
        TextField("", text: $inputValue)
			.font(self.appearance.inputField.textFieldInternalTextLabel.font)
			.foregroundColor(self.appearance.inputField.textFieldInternalTextLabel.titleColor)
            .multilineTextAlignment(.center)
            .apply(padding: appearance.inputField.borderPadding)
            .frame(
                minWidth:self.appearance.inputFieldSize.width,
                minHeight: self.appearance.inputFieldSize.height
            )
			.background(appearance.inputField.backgroundColor)
            .fixedSize(horizontal:true, vertical: false)
            .nitrozen.roundedCornerWithBorder(
                color: self.appearance.inputField.borderColor,
                radius: self.appearance.inputField.borderRadius,
                lineWidth: self.appearance.inputField.borderWidth
            )
            .keyboardType(.numberPad)
            .onReceive(inputValue.publisher) { text in
                if intInputValue > maxInputValue{
                    inputValue.remove(at: inputValue.index(before: inputValue.endIndex))
                }
            }
        
        
    }
    
    @ViewBuilder
    func incrementActionButton() -> some View{
		let isButtonDisable = (maxInputValue == intInputValue)
		
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
				switch appearance.incrementButton {
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
	func decrementActionButton() -> some View{
		let isButtonDisable = (minInputValue == intInputValue)
		
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
				switch appearance.decrementButton {
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
		var value = intInputValue
		value += step
		inputValue = min(value, self.maxInputValue).description
    }
    
    func decrement(){
		var value = intInputValue
		value -= step
		inputValue = max(value, self.minInputValue).description
    }
    
}
