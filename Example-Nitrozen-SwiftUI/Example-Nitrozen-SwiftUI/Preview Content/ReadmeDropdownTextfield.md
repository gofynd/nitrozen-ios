
## Dropdown textfield - NitrozenDropDownTextField - Preview

| Preview1 |
| ---      |
| <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/dropdown1.png" width="300"> |

## Dropdown textfield code snippets
All Dropdown textfield examples with info, success, error, custom right view

```swift
struct DropDownTextField: View {

	@State var textField1: String = ""
	@State var textField2: String = ""
	@State var textField3: String = ""
	@State var textField4: String = ""
	@State var textField5: String = ""
	@State var textField6: String = ""
	
	var body: some View {
		List{
			
			Section {
				Text("DropDown Textfields with Top info")

				NitrozenDropdownTextField(
					binding: $textField1,
					placeHolder: "Select item of Textfield 1",
					infos: [
						.init(position: .top, text: "This is textfield 1")
					]) {
						print("DropDown TextField  did tap")
					}
			}
			
			Section {
				Text("DropDown Textfields with Success info")

				NitrozenDropdownTextField(
					binding: $textField2,
					placeHolder: "Select item of Textfield 2",
					infos: [
						.init(position: .top, text: "This is textfield 2"),
						.init(position: .success, text: "Success of textfield 2")
					]) {
						print("DropDown TextField  did tap")
					}
			}
			
			Section {
				Text("DropDown Textfields with Error info")

				NitrozenDropdownTextField(
					binding: $textField3,
					placeHolder: "Select item of Textfield 3",
					infos: [
						.init(position: .top, text: "This is textfield 3"),
						.init(position: .error, text: "Success of textfield 3")
					]) {
						print("DropDown TextField  did tap")
					}
			}
			
			
			Section {
				Text("DropDown Textfield with custom right view and top info")

				NitrozenDropdownTextField(
					binding: $textField5,
					placeHolder: "Select item of Textfield 5",
					infos: [
						.init(position: .top, text: "This is textfield 5")
					],
					onTap: {
						print("DropDown TextField  did tap")
					},
					rightView: AnyView(
						HStack {
							Divider()
							Text("Number")
							Image(systemName: "steeringwheel.and.key")
						}
							.onTapGesture {
								print("Tap on custom view")
							}
					)
				)
			}
		}
	}
}

```
