[![Swift](https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/Nitrozen-github-white.png)](https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/Nitrozen-github-white.png)

[![Swift](https://img.shields.io/badge/Swift-5%2B-blue)](https://img.shields.io/badge/Swift-5%2B-blue)
[![Platforms](https://img.shields.io/badge/Platforms-iOS-orange)](https://img.shields.io/badge/Platforms-iOS-orange)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)

Nitrozen-SwiftUI is a UILibrary, not designed for specific fonts, colors or fixed-type of layouts. Fonts, colors and layouts are highly customisable.

## Requirements

| Platform | Minimum Swift Version | Installation | Status |
| --- | --- | --- | --- |
| iOS 13.0+ | 5.0 | [Swift Package Manager](#swift-package-manager), [Manual](#manually) | Fully Tested |

## How to install? - via Swift Package Manager

The  [Swift Package Manager](https://swift.org/package-manager/)  is a tool for automating the distribution of Swift code and is integrated into the  `swift`  compiler.

Once you have your Swift package set up, adding Nitrozen-SwiftUI as a dependency is as easy as adding it to the  `dependencies`  value of your  `Package.swift`.

```
dependencies: [
    .package(url: "https://github.com/gofynd/nitrozen-ios.git", branch: "master")
]
```

## Elements
### [1. Button](https://github.com/hitendra-gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeButton.md)
### [2. Text/Label/Font](https://github.com/hitendra-gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeTextLabelFont.md)


### 3. TextField - NitrozenTextField
| Preview1 | Preview2 |
| ---      | ---       |
| <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/textfield1.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/textfield2.png" width="300"> |

### TextField code snippets
All TextField variants
```swift
struct TextFields: View {

	@State var textField1: String = ""
	@State var textField2: String = ""
	@State var textField3: String = ""
	@State var textField4: String = "lorem ipsum text by user"
	@State var textField5: String = "lorem ipsum text by user"
	@State var textField6: String = "lorem ipsum text by user"
	
	var body: some View {
		List{
			
			Section {
				Text("Textfields with Top info")

				NitrozenTextField(
					binding: $textField1,
					placeHolder: "Textfield 1",
					infos: [
						.init(position: .top, text: "This is textfield 1")
					],
					leftView: nil, rightView: nil)
			}
			
			Section {
				Text("Textfields with Success info")

				NitrozenTextField(
					binding: $textField2,
					placeHolder: "Textfield 2",
					infos: [
						.init(position: .top, text: "This is textfield 2"),
						.init(position: .success, text: "Success of textfield 2")
					],
					leftView: nil, rightView: nil)
			}
			
			Section {
				Text("Textfields with Error info")

				NitrozenTextField(
					binding: $textField3,
					placeHolder: "Textfield 3",
					infos: [
						.init(position: .top, text: "This is textfield 3"),
						.init(position: .error, text: "Error of textfield 3")
					])
			}
			
			Section {
				Text("Disable Textfields with Top info")

				NitrozenTextField(
					binding: $textField4,
					placeHolder: "Textfield 4",
					infos: [
						.init(position: .top, text: "This is textfield 4")
					])
				.disabled(true)
			}
			
			Section {
				Text("Left and right view Textfields with Top info")

				NitrozenTextField(
					binding: $textField5,
					placeHolder: "Textfield 5",
					infos: [
						.init(position: .top, text: "This is textfield 5")
					],
					leftView: AnyView(Image(systemName: "person.fill")),
					rightView: AnyView(Image(systemName: "steeringwheel.and.key"))
				)
			}
			
			Section {
				Text("Password Textfields with Left and right view and top info")

				NitrozenTextField(
					binding: $textField6,
					placeHolder: "Password",
					infos: [
						.init(position: .top, text: "Enter your password")
					],
					isSecure: true,
					leftView: AnyView(Image(systemName: "key.fill")),
					rightView: AnyView(Image(systemName: "eye.fill")) //Use button here instead of Image - to get tap interaction
				)
			}
		}
	}
}
```


### 4. Checkbox - NitrozenCheckbox

| Preview1 |
| ---      |
| <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/checkbox1.png" width="300"> |

### Checkboxes code snippets
All Checkbox examples with custom model and string data
```swift
struct Checkboxes: View {
	
	var options1: [String] = ["Male", "Female", "Other"]
	@State var selection1: Set<String> = ["Male"]
	
	var options2: [String] = ["O1", "O2", "O3"]
	@State var selection2: Set<String> = []
	
	
	var options3: [User] = User.users
	@State var selection3: Set<User> = []
	
	var options4: [String] = ["Home", "Office", "Shop", "Market", "Godown", "Truck", "Rikshaw"]
	@State var selection4: Set<String> = []
	
	
	var body: some View {
		List{
			Section {
				Text("Verticle Checkbox")
				
				NitrozenCheckbox(
					options: self.options1, selection: $selection1,
					layout: .verticle)
					.frame(maxWidth: .infinity, alignment: .leading)
			}
			
			Section {
				Text("Horizontal Checkbox")
				
				NitrozenCheckbox(
					options: self.options2,
					selection: $selection2,
					layout: .horizontal,
					appearance: nil
				)
					.frame(maxWidth: .infinity, alignment: .leading)
			}
			
			Section {
				Text("Collection layout Checkbox \n- Custom fonts, size, color \n- custom selection view")
				
				NitrozenCheckbox(
					options: self.options4,
					selection: $selection4,
					layout: .collection,
					appearance: NitrozenAppearance.shared
						.checkbox.copy
						.selectedTitle(.init(titleColor: .orange, font: .nitrozen(.body(size: .xs, weight: .bold))))
						.deSelectedTitle(.init(titleColor: .orange, font: .nitrozen(.body(size: .xs, weight: .regular))))
						.selectedBorderColor(.orange)
						.deselectedBorderColor(.orange)
						.size(.init(width: 16, height: 16))
						.selectedImage(
							AnyView(
								Image(systemName: "pencil")
									.resizable()
									.foregroundColor(.white)
									.padding(4)
									.background(.orange)
									.nitrozen.roundedCornerWithBorder(color: .orange, radius: 4)
							)
						)
				)
			}
			
			Section {
				Text("Verticle Checkbox with custom Model and appearance")
				
				NitrozenCheckbox(
					options: self.options3, selection: $selection3,
					layout: .verticle,
					appearance:
						NitrozenAppearance.shared
						.checkbox.copy
						.selectedBorderColor(.purple)
						.selectedTitle(NitrozenAppearance.shared.checkbox.selectedTitle.copy.titleColor(.purple))
				)
				.frame(maxWidth: .infinity, alignment: .leading)
			}
		}
	}
}

//confirm NitrozenElementStringSelectableStyle to String, to enable usage with NitrozenCheckbox
extension String: NitrozenElementStringSelectableStyle {
	public var selectionTitle: String { return self  }
}

//confirm Hashable to your custom model, to enable usage with NitrozenCheckbox
struct User: Hashable {
	var name: String
	var id: UUID = UUID()
	var age: Int
	
	static var users: [User] = [
		.init(name: "Rushang", age: 28),
		.init(name: "Hitendra", age: 30),
		.init(name: "Keyur", age: 28)
	]
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}

//confirm NitrozenElementStringSelectableStyle to your custom model, to enable usage with NitrozenCheckbox
extension User: NitrozenElementStringSelectableStyle {
	var selectionTitle: String {
		return self.name + " " + "Age: \(self.age)"
	}
}
```

### 5. Radio - NitrozenRadio

| Preview1 |
| ---      |
| <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/radio1.png" width="300"> |

### RadioButtons code snippets
All RadioButton examples with custom model and string data
```swift
struct RadioButton: View {
	
	var options1: [String] = ["Male", "Female", "Other"]
	@State var selection1: Set<String> = ["Male"]
	
	var options2: [String] = ["O1", "O2", "O3"]
	@State var selection2: Set<String> = ["O1"]
	
	var options3: [User] = User.users
	@State var selection3: Set<User> = []
	
	@State var isSelected: Bool = true
	
	var body: some View {
		List{
			Section(selection1.first ?? "") {
				Text("Horizontal RadioButton With Title")
				NitrozenRadio(
					options: self.options1, selection: $selection1,
					layout: .horizontal)
				.frame(maxWidth: .infinity, alignment: .leading)
			}
			
			Section(selection2.first ?? "") {
				Text("Vetical RadioButton With Title\n- custom spacing")
				NitrozenRadio(
					options: self.options2, selection: $selection2,
					layout: .verticle, itemSpacing: 2)
				.frame(maxWidth: .infinity, alignment: .leading)
			}
			
			Section(selection3.first?.name ?? "") {
				
				Text("Vertical RadioButton With Title and Subtitle | Custom Model")
				NitrozenRadio(
					options: self.options3,
					selection: $selection3,
					layout: .verticle
				)
				
			}
			
			Section {
				
				Text("Vertical with only RadioButton")
				NitrozenRadioButtonItem(isSelected: isSelected)
				
			}
			
		}
	}
}

//confirm NitrozenElementStringSelectableStyle to String, to enable usage with NitrozenRadio
extension String: NitrozenElementRadioStringSelectableStyle {
	public var selectionTitleText: String { return self  }
	public var selectionSubTitleText: String? { return ""  }
}

//confirm Hashable to your custom model, to enable usage with NitrozenRadio
struct User: Hashable {
	var name: String
	var id: UUID = UUID()
	var age: Int
	
	static var users: [User] = [
		.init(name: "Rushang", age: 28),
		.init(name: "Hitendra", age: 30),
		.init(name: "Keyur", age: 28)
	]
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}

//confirm NitrozenElementRadioStringSelectableStyle to your custom model, to enable usage with NitrozenRadio
extension User: NitrozenElementRadioStringSelectableStyle  {
	var selectionSubTitleText: String? {
		return "Age: \(self.age)"
	}
	var selectionTitleText: String {
		return self.name
	}
}
```

### 6. Color Pallets - NitrozenAppearance.ColorProvider (Available - preview and code snippet coming soon)
### 7. DropDown TextField - NitrozenDropDownTextField (Available - preview and code snippet coming soon)  
### 8. TagView/Chip - NitrozenTagView (Available - preview and code snippet coming soon)
### 9. Badge View - NitrozenTagView (Available - preview and code snippet coming soon)
### 10. Switch/Toggle  - NitrozenToggle (Available - preview and code snippet coming soon)
### 11. Progress Stepper - NitrozenPageControl (Available - preview and code snippet coming soon)

## Contributors

1. Hitendra Solanki - HS
2. Rushang Prajapati - RP
3. Keyur Patel - KP
4. your name here :) - We are expecting more contributor

## How to Contribute?

1. Fork Repo and Create PR. 
2. We will review your PR, if PR will be merged successfully, we will add you to the contributors list. Happy coding :)

## License

Nitrozen-SwiftUI is released under the MIT license.


