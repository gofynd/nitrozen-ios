
## TagView - NitrozenTagView - Preview

| Preview1 |
| ---      |
| <img src="https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/StepperView_Example.png" width="300"> |

## TagViews code snippets
All TagView examples with custom model and string data
```swift
struct TagViews: View {
	
	var options1: [String] = ["Male", "Female", "Other"]
	@State var selection1: Set<String> = ["Male"]
	
	var options3: [User] = User.users
	@State var selection3: Set<User> = []
	
	var options2: [String] = ["Home", "Office", "Shop"]
	@State var selection2: Set<String> = []
	
	var options4: [String] = ["Home", "Office", "Shop", "Market", "Godown", "Truck", "Rikshaw", "Van", "Car"]
	@State var selection4: Set<String> = []
	
	
	var body: some View {
		List{
			
			Section {
				Text("Single tag selection")
				
				NitrozenTagView(
					options: options1, selection: $selection1,
					spacing: 8, allowedSelection: .single
				)
			}
			
			Section {
				Text("Multi tag selection with custom view")
				
				NitrozenTagView(
					options: options3, selection: $selection3,
					spacing: 8, allowedSelection: .multiple) { option, isSelected in
						
						HStack {
							VStack {
								HStack {
									Image(systemName: "person")
										.resizable()
										.aspectRatio(contentMode: .fit)
										.frame(width: 20, height: 20)
									Text(option.name)
								}
								HStack {
									Image(systemName: "person.2.wave.2")
										.resizable()
										.aspectRatio(contentMode: .fit)
										.frame(width: 20, height: 20)
									Text("Age: " + "\(option.age)")
								}
							}
							.foregroundColor(isSelected ? .blue : .black)
						}
						.padding(.horizontal)
					}
			}
		}
	}
}

extension String: Identifiable {
	public var id: String { return self }
}

extension User: Identifiable {}

```
