
## TagView - NitrozenStepperView - Preview

| Preview1 |
| ---      |
| <img src="https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/StepperView_Example.png" width="300"> |

## StepperView code snippets
All TagView examples with custom model and string data
```swift
struct Stepper: View {
    
    @State var countText:String = "0"
    @State var countText2:String = "0"
    @State var countText3:String = "0"
    @State var countText4:String = "0"
    @State var countText5:String = "0"
    @State var countText6:String = "0"
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading, spacing: 16){
                Group {
                    Section("Stepper with circle button with 20 Limit\nCurrent count \(countText)"){
                        NitrozenStepperView(
                            totalQuntity: $countText,
                            maxNumber: 20,
                            itemSpacing: 8
                        )
                    }
                    
                    Divider()
                    
                    Section("Stepper with square button 200000 Limit\nCurrent count \(countText2)"){
                        NitrozenStepperView(
                            totalQuntity: $countText2,
                            appearance: NitrozenAppearance.shared.stepperView.copy
                                .viewShpae(.roundedRectangle(radius: 1))
                                .inputFieldSize(.init(width: 40, height: 32)),
                            maxNumber: 200000,
                            itemSpacing: 8
                        )
                    }
                    
                    Divider()
                    
                }
                
                Section("Custom height width for steper with 10 Limit\nCurrent count \(countText3)"){
                    NitrozenStepperView(
                        totalQuntity: $countText3,
                        appearance: NitrozenAppearance.shared.stepperView.copy
                            .inputFieldSize(.init(width: 80, height: 50))
                            .decrementButton(.systemImage(name: "minus"))
                            .incrementButton(.systemImage(name: "plus"))
                        ,
                        maxNumber: 10,
                        itemSpacing: 8
                    )
                }
                
                Divider()
                
                Section("Custom button for steper 10 Limit\ncurrent count \(countText5)"){
                    NitrozenStepperView(
                        totalQuntity: $countText5,
                        appearance: NitrozenAppearance.shared.stepperView.copy
                            .inputTitle(NitrozenAppearance.TextLabel.init(titleColor: .red, font: .nitrozen(.body(size: .s, weight: .regular))))
                            .actionButton(NitrozenAppearance.Button.init(
                                styleUseCase: NitrozenAppearance.Button.StyleUseCase.bordered,
                                titleColor: .red,
                                titleColorDisabled: .gray,
                                backgroundColor: .green,
                                backgroundColorDisabled: .gray,
                                font: .nitrozen(.body(size: .s, weight: .regular)),
                                borderWidth: 1.9, borderColor: .blue, borderColorDisabled: .blue))
                            .inputFieldSize(.init(width: 40, height: 30))
                            .decrementButton(.systemImage(name: "minus"))
                            .incrementButton(.systemImage(name: "plus"))
                        ,
                        maxNumber: 10,
                        itemSpacing: 8
                    )
                }
                
                Spacer()
            }
        }
        .padding(.horizontal)
        
    }
    
}
