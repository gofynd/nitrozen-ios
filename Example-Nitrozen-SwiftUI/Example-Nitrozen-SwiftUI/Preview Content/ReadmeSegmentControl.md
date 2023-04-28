## Segment Control - Preview

| Preview1 | Preview2 |
| ---      | ---      |
| <img src="https://raw.githubusercontent.com/keyur-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/segmentcontrol1.png" width="300"> | <img src="https://raw.githubusercontent.com/keyur-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/segmentcontrol2.png" width="300"> |

## Segment Control code snippets
Segment Control with example
```swift
struct SegmentControlViews: View {
    
    var options1: [String] = ["Item1", "Item2", "Item3"]
    @State var selection1: String = "Item2"
    
    var options2: [String] = ["Item1", "Item2", "Item3"]
    @State var selection2: String = "Item2"
    
    var options4: [String] = ["Home", "Office", "Shop", "Market", "Godown", "Truck"]
    @State var selection4: String = "Male"
    
    var options5: [String] = ["Item1", "Item2", "Item3"]
    @State var selection5: String = "Item2"

    var options6: [String] = ["Item1", "Item2", "Item3"]
    @State var selection6: String = "Item3"

    
    var body: some View {
        List{
            
            Section {
                Text("Segment Control with default apperance\n- full width - Custom fixed height")
                NitrozenSegmentControl(options: self.options1, selection: $selection1)
            }
            
            Section {
                Text("Segment Control with custom apperance \n- Custom Fixed width - Custom fixed Height")
                NitrozenSegmentControl(
                    options: self.options2,
                    selection: $selection2,
                    appearance: NitrozenAppearance.shared
                        .segment.copy
                        .itemSize(.init(width: 60, height: 30))
                        .itemSpacing(8)
                )
            }
            
            Section {
                Text("Segment Control with default apprance\n- Custom View \n- full width - Custom fixed height")
                NitrozenSegmentControl(
                    options: options5,
                    selection: $selection5,
                    itemBuilder: { item, isSelected in
                        
                        HStack {
                            Group {
                                Image(systemName: "heart.fill")
                                Text(item)
                            }.if(isSelected) { group in
                                group
                                    .font(NitrozenAppearance.shared.segment.selectedTitleAppearance.font)
                                    .foregroundColor(NitrozenAppearance.shared.segment.selectedTitleAppearance.titleColor)
                            }.if(isSelected == false) { group in
                                group
                                    .font(NitrozenAppearance.shared.segment.titleAppearance.font)
                                    .foregroundColor(NitrozenAppearance.shared.segment.titleAppearance.titleColor)
                            }
                            
                        }
                        
                    },
                    appearance: nil
                )
                
            }
            
            Section {
                Text("Segment Control with custom apperance\n- Custom View \n- Custom Fixed width - Custom fixed Height")
                NitrozenSegmentControl(
                    options: options6,
                    selection: $selection6,
                    itemBuilder: { item, isSelected in
                        
                        VStack {
                            Group {
                                Image(systemName: "heart.fill")
                                Spacer().frame(height: 10)
                                Text(item)
                            }.if(isSelected) { group in
                                group
                                    .font(NitrozenAppearance.shared.segment.selectedTitleAppearance.font)
                                    .foregroundColor(NitrozenAppearance.shared.segment.selectedTitleAppearance.titleColor)
                            }.if(isSelected == false) { group in
                                group
                                    .font(NitrozenAppearance.shared.segment.titleAppearance.font)
                                    .foregroundColor(NitrozenAppearance.shared.segment.titleAppearance.titleColor)
                            }
                            
                        }
                        
                    },
                    appearance: NitrozenAppearance.shared
                        .segment.copy
                        .itemSize(.init(width: 90, height: 60))
                        .itemSpacing(8)
                )
                
            }
            
        }
    }
}

```
