## Page Control - Preview

| Preview1 | Preview2 |
| ---      | ---      |
| <img src="https://raw.githubusercontent.com/keyur-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/pagecontrol1.png" width="300"> | <img src="https://raw.githubusercontent.com/keyur-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/pagecontrol2.png" width="300"> |

## Page Control code snippets
Page Control with example
```swift
struct PageControls: View {
    
    let totalPages1 = 5
    @State var currentPage1: Int = 4
    
    let totalPages2 = 8
    @State var currentPage2: Int = 2
    
    let totalPages3 = 4
    @State var currentPage3: Int = 3
    
    let totalPages4 = 6
    @State var currentPage4: Int = 2
    
    let totalPages5 = 10
    @State var currentPage5: Int = 6
    
    let totalPages6 = 3
    @State var currentPage6: Int = 1
    
    var body: some View {
        List{
            
            Section {

                Text("Nitrozen style with wider current selection \n- animated next/previous actions")
                NitrozenPageControl(
                    pageCount: totalPages1,
                    currentPage: $currentPage1,
                    selectedView: .nitrozen, deselectedView: .nitrozen,
                    viewUseCase: .pageControl
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
                
                Text("Nitrozen style with infinity width \n- animated next/previous actions")
                NitrozenPageControl(
                    pageCount: totalPages6,
                    currentPage: $currentPage6,
                    selectedView: .nitrozen, deselectedView: .nitrozen,
                    viewUseCase: .pageControl,
                    appearance: NitrozenAppearance.shared.pageControl.copy
                        .spacing(10)
                        .selectedColor(.blue.opacity(0.5))
                        .deselectedColor(.gray.opacity(0.5))
                        .selectedViewShape(.capsule).deselectedViewShape(.capsule)
                        .selectedSize(.init(width: Double(CGFloat.infinity), height: 8))
                        .deSelectedSize(.init(width: Double(CGFloat.infinity), height: 8))
                )
                Button("Previous") {
                    withAnimation {
                        self.currentPage6 -= 1
                    }
                }
                Button("Next") {
                    withAnimation {
                        self.currentPage6 += 1
                    }
                }
            }

            Section {

                Text("Nitrozen style with wider current selection \n- custom colors for views and borders")
                NitrozenPageControl(
                    pageCount: totalPages2,
                    currentPage: $currentPage2,
                    selectedView: .nitrozen, deselectedView: .nitrozen,
                    viewUseCase: .pageControl,
                    appearance: NitrozenAppearance.shared
                        .pageControl.copy
                        .selectedColor(.purple.opacity(0.5)).selectedBorderColor(.purple)
                        .deselectedColor(.purple.opacity(0.5)).deselectedBorderColor(.purple.opacity(0.25))
                        .selectedBorderWidth(2).deselectedBorderWidth(1)

                )
                Button("Previous") {
                    self.currentPage2 -= 1
                }
                Button("Next") {
                    self.currentPage2 += 1
                }
            }

            Section {
                Text("custom .circle style with current selection \n- custom colors for views\n- custom width for borders")
                NitrozenPageControl(
                    pageCount: totalPages3,
                    currentPage: $currentPage3,
                    selectedView: .nitrozen, deselectedView: .nitrozen,
                    viewUseCase: .pageControl,
                    appearance: NitrozenAppearance.shared
                        .pageControl.copy
                        .selectedViewShape(.circle).deselectedViewShape(.circle)
                        .selectedSize(.init(width: 10, height: 10)).deSelectedSize(.init(width: 10, height: 10))
                        .selectedColor(.purple)
                        .deselectedColor(.purple.opacity(0.5))
                        .selectedBorderWidth(2).deselectedBorderWidth(1)

                )
                Button("Previous") {
                    self.currentPage3 -= 1
                }
                Button("Next") {
                    self.currentPage3 += 1
                }
            }

            Section {
                Text("custom .circle style with current selection \n- custom size \n- custom colors for views")
                NitrozenPageControl(
                    pageCount: totalPages4,
                    currentPage: $currentPage4,
                    selectedView: .nitrozen, deselectedView: .nitrozen,
                    viewUseCase: .pageControl,
                    appearance: NitrozenAppearance.shared
                        .pageControl.copy
                        .selectedViewShape(.circle).deselectedViewShape(.circle)
                        .selectedSize(.init(width: 30, height: 30)).deSelectedSize(.init(width: 15, height: 15))
                        .selectedColor(.orange)
                        .deselectedColor(.orange.opacity(0.5))
                )
                Button("Previous") {
                    self.currentPage4 -= 1
                }
                Button("Next") {
                    self.currentPage4 += 1
                }
            }

            Section {
                Text("custom .circle style with current selection \n- custom view - custom size \n- custom colors for views")
                NitrozenPageControl(
                    pageCount: totalPages5,
                    currentPage: $currentPage5,
                    selectedView: .custom(view: AnyView(
                        Rectangle().cornerRadius(8)
                    )),
                    deselectedView: .custom(view: AnyView(
                        Rectangle().cornerRadius(4)
                    )),
                    viewUseCase: .pageControl,
                    appearance: NitrozenAppearance.shared
                        .pageControl.copy
                        .selectedViewShape(.none).deselectedViewShape(.none)
                        .selectedSize(.init(width: 30, height: 30)).deSelectedSize(.init(width: 15, height: 15))
                        .selectedColor(.pink)
                        .deselectedColor(.pink.opacity(0.5))
                )
                Button("Previous") {
                    self.currentPage5 -= 1
                }
                Button("Next") {
                    self.currentPage5 += 1
                }
            }
            
        }
    }
}
```
