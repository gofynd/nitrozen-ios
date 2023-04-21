
## ProgressStepper - NitrozenPageControl - Preview

| Preview1 |
| ---      |
| <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/progressStepperView1.png" width="300"> |

## ProgressStepper code snippets
All ProgressStepper examples with styling
```swift
struct StapperView: View {
    
    let totalPages1 = 4
    @State var currentPage1: Int = 1
    
    let totalPages2 = 6
    @State var currentPage2: Int = 2
    
    let totalPages3 = 3
    @State var currentPage3: Int = 1
    
   
    var body: some View {
        List{
            
            Section {
                
                Text("Nitrozen style with infinity width \n- animated next/previous actions")
                NitrozenPageControl(
                    pageCount: totalPages1,
                    currentPage: $currentPage1,
                    selectedView: .nitrozen, deselectedView: .nitrozen,
                    viewUseCase: .stapper
                )
                Button("Previous") {
                    withAnimation {
                        self.currentPage1 -= 1
                    }
                }
                Button("Next") {
                    withAnimation {
                        self.currentPage1 += 1
                    }
                }
            }


            Section {
                Text("Nitrozen style with wider current selection \n- custom colors for views and borders")
                NitrozenPageControl(
                    pageCount: totalPages2,
                    currentPage: $currentPage2,
                    selectedView: .nitrozen, deselectedView: .nitrozen,
                    viewUseCase: .stapper,
                    appearance: NitrozenAppearance.shared
                        .pageControl.copy
                        .spacing(4)
                        .selectedViewShape(.capsule).deselectedViewShape(.capsule)
                        .selectedColor(.purple.opacity(0.5)).selectedBorderColor(.purple)
                        .deselectedColor(.purple.opacity(0.5)).deselectedBorderColor(.purple.opacity(0.25))
                        .selectedBorderWidth(2).deselectedBorderWidth(1)
                        .selectedSize(.init(width: Double(CGFloat.infinity), height: 8))
                        .deSelectedSize(.init(width: Double(CGFloat.infinity), height: 8))

                )
                Button("Previous") {
                    self.currentPage2 -= 1
                    print(self.currentPage2)
                }
                Button("Next") {
                    self.currentPage2 += 1
                    print(self.currentPage2)
                }
            }

            Section {
                Text("custom Rectangle style with current selection \n- custom colors for views\n- custom width for borders")
                NitrozenPageControl(
                    pageCount: totalPages3,
                    currentPage: $currentPage3,
                    selectedView: .nitrozen, deselectedView: .nitrozen,
                    viewUseCase: .stapper,
                    appearance: NitrozenAppearance.shared
                        .pageControl.copy
                        .selectedViewShape(.roundedRectangle(radius: 0)).deselectedViewShape(.roundedRectangle(radius: 0))
                        .selectedSize(.init(width: 10, height: 10)).deSelectedSize(.init(width: 10, height: 10))
                        .selectedColor(.purple)
                        .deselectedColor(.purple.opacity(0.5))
                        .selectedBorderWidth(2).deselectedBorderWidth(1)
                        .selectedSize(.init(width: Double(CGFloat.infinity), height: 8))
                        .deSelectedSize(.init(width: Double(CGFloat.infinity), height: 8))

                )
                Button("Previous") {
                    self.currentPage3 -= 1
                }
                Button("Next") {
                    self.currentPage3 += 1
                }
            }
        }
    }
}

struct StapperView_Previews: PreviewProvider {
    static var previews: some View {
        StapperView()
    }
}
```
