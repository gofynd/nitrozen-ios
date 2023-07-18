//
//  Stepper.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Rushang Prajapati on 24/04/23.
//

import Foundation
import SwiftUI
import Nitrozen_SwiftUI

struct Stepper: View {
    
    @State var countText1:String = "0"
    @State var countText2:String = "0"
    @State var countText3:String = "0"
    @State var countText4:String = "0"
    @State var countText5:String = "0"
    @State var countText6:String = "0"
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading, spacing: 16){
                Group {
                    Section("Range = [0-20] Step = 1\nCurrent count \(countText1)"){
                        NitrozenStepperView(
                            inputValue: $countText1,
                            range: Range(0...20),
                            step: 1,
                            disableStepButton: (min: countText1 == "1", max: countText1 == "8"),
                            itemSpacing: 8
                        )
                    }
                    
                    Divider()
                    
					Section("Range = [0-20] Step = 2\nCurrent count \(countText2)\nLeft Button Disable"){
                        NitrozenStepperView(
                            inputValue: $countText2,
                            range: Range(0...20),
                            step: 2,
                            itemSpacing: 8,
                            appearance: NitrozenAppearance.shared.stepperView.copy
                                .viewShpae(.roundedRectangle(radius: 1))
                                .inputFieldSize(.init(width: 40, height: 32))
                        )
                    }

                    Divider()
                    
                }
				
				Section("Range = [0-10] Step = 2 \nCurrent count \(countText3)\nLeft Button Disable\nCustom height width"){
				NitrozenStepperView(
                        inputValue: $countText3,
                        range: Range(0...10),
                        step: 2,
                        itemSpacing: 8,
                        appearance: NitrozenAppearance.shared.stepperView.copy
                            .inputFieldSize(.init(width: 80, height: 50))
                            .decrementButton(.systemImage(name: "minus"))
                            .incrementButton(.systemImage(name: "plus"))

                    )
                }
                
                Divider()
                
				Section("Range = [0-10] Step = 1\nCurrent count \(countText3)\nLeft Button Disable\nCustom button"){
                    NitrozenStepperView(
                        inputValue: $countText5,
                        range: Range(0...10),
                        step: 1,
                        itemSpacing: 8,
                        appearance: NitrozenAppearance.shared.stepperView.copy
                            .actionButton(NitrozenAppearance.Button.init(
                                styleUseCase: NitrozenAppearance.Button.StyleUseCase.bordered,
                                titleColor: .red,
                                titleColorDisabled: .white,
                                backgroundColor: .green,
                                backgroundColorDisabled: .gray,
                                font: .nitrozen(.body(size: .s, weight: .regular)),
                                borderWidth: 1.9,
                                borderColor: .red,
                                borderColorDisabled: .blue)
                            )
                            .inputFieldSize(.init(width: 40, height: 30))
                            .decrementButton(.systemImage(name: "minus"))
                            .incrementButton(.systemImage(name: "plus"))

                    )
                }
                
                Spacer()
            }
        }
        .padding(.horizontal)
        
    }
    
}

