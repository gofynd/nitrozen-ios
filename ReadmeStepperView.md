
## NitrozenStepperView - Preview

| Preview1 |
| ---      |
| <img src="https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/stepperView.png" width="300"> |

## StepperView code snippets
All StepperView examples with custom model and string data
```swift
struct Stepper: View {
    
    @State var countText1:String = "0"
    @State var countText2:String = "1000"
    @State var countText3:String = "0"
    @State var countText4:String = "0"
    @State var countText5:String = "0"
    @State var countText6:String = "0"
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading, spacing: 16){
                Group {
                    Section("Stepper with circle button with 20 Limit\nCurrent count \(countText1)"){
                        NitrozenStepperView(
                            inputValue: $countText1,
                            range: Range(0...20),
                            step: 1,
                            itemSpacing: 8
                        )
                    }
                    
                    Divider()
                    
                    Section("Stepper with square button 2000 Limit and 100 step\nCurrent count \(countText2)"){
                        NitrozenStepperView(
                            inputValue: $countText2,
                            appearance: NitrozenAppearance.shared.stepperView.copy
                                .viewShpae(.roundedRectangle(radius: 1))
                                .inputFieldSize(.init(width: 40, height: 32)),
                            range: Range(1000...2000),
                            step: 100,
                            itemSpacing: 8
                        )
                    }

                    Divider()
                    
                }
                
                Section("Custom height width for steper with 10 and 2 step Limit\nCurrent count \(countText3)"){
                    NitrozenStepperView(
                        inputValue: $countText3,
                        appearance: NitrozenAppearance.shared.stepperView.copy
                            .inputFieldSize(.init(width: 80, height: 50))
                            .decrementButton(.systemImage(name: "minus"))
                            .incrementButton(.systemImage(name: "plus"))
                        ,
                        range: Range(0...10),
                        step: 2,
                        itemSpacing: 8
                    )
                }
                
                Divider()
                
                Section("Custom button for steper 10 Limit\ncurrent count \(countText5)"){
                    NitrozenStepperView(
                        inputValue: $countText5,
                        appearance: NitrozenAppearance.shared.stepperView.copy
                            .inputTitle(NitrozenAppearance.TextLabel.init(titleColor: .red, font: .nitrozen(.body(size: .s, weight: .regular))))
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
                        ,
                        range: Range(0...10),
                        step: 1,
                        itemSpacing: 8
                    )
                }
                
                Spacer()
            }
        }
        .padding(.horizontal)
        
    }
    
}
