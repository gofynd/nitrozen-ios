## Action Sheet - Preview

| Preview1 |
| ---      |
| <img src="https://raw.githubusercontent.com/keyur-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/actionsheet1.png" width="300"> |

## Action Sheet code snippets
Action Sheet with example
```swift
struct ActionOptions: Identifiable {
    
    var name: String
    var id: UUID = UUID()
    var icon: String
    
    static var options: [ActionOptions] = [
        .init(name: "Camera", icon: "camera"),
        .init(name: "Photo", icon: "photo"),
    ]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

struct ActionSheet: View {
    
    var options: [ActionOptions] = ActionOptions.options
    @State var showingSheet = false
    
    var body: some View {
        List{
            Section {
                Text("Gallary Options")
                    .onTapGesture {
                        self.showingSheet.toggle()
                    }
            }
            
        }
        .nitrozenSheet(isPresented: $showingSheet, postion: .bottom, content: {
            NitrozenActionSheet(
                title: "Select Profile Picture!!",
                isShowing:$showingSheet,
                closeView: NitrozenActionSheet.CustomView.nitrozen,
                content: {
                    VStack(alignment: .leading, spacing: 12){
                        ForEach(options) { option in
                            HStack(alignment: .top) {
                                Image(systemName: option.icon)
                                Text(option.name)
                                    .body(size: .s, weight: .regular)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            .frame(height: 30.0)
                            .padding(0)
                        }
                        
                    }
                    .padding([.top,.bottom], 10)
                    
                })
            
        })
        
    }
    
}

```
