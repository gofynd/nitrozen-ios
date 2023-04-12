# Nitrozen-SwiftUI
## Nitrozen-UILibrary, not designed for specific fonts, colors or fixed-type of layouts. Fonts, colors and layouts are highly customisable.

## Elements
### 1. Button Previews

| Preview1 | Preview2 | Preview3 | Preview4 | Preview5 |
| ---      | ---       | ---       | ---       | ---       |
| <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/buttons1.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/buttons2.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/buttons3.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/buttons4.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/buttons5.png" width="300"> |

### Button code snippets
Setup one-time Primary button apperance, this will used for all primary buttons.  
```swift
	NitrozenAppearance.shared.primaryButton
		.backgroundColor(primaryColor)
		.backgroundColorDisabled(primaryColor.opacity(disabledButtonOpacity))
		.titleColor(.white)
		.titleColorDisabled(.white.opacity(disabledButtonOpacity))
		.font(font)
		.borderWidth(0.0)
		.borderColor(primaryColor)
		.borderColorDisabled(.gray)
		
	//similarly, NitrozenAppearance.shared.borderedButton available
	//similarly, NitrozenAppearance.shared.tertiaryButton available
	//and same consistent one-time apperance settings for all available UI-Elements, e.g. NitrozenAppearance.shared.textfield
```
		
			
Primary button
```swift
	Button(action: {}) {
		Text("Click me")
			.frame(maxWidth: .infinity)
	}
	.primaryButton()
```
Primary Disable button
```swift
	Button(action: {}) {
		Text("Click me")
			.frame(maxWidth: .infinity)
	}
	.disabled(true)
	.primaryButton()
```
Primary loading button
```swift
	@State var isButtonLoading: Bool = false //declare state boolean at view level
	
	Button(action: {}) {
		Text("Click me")
			.frame(maxWidth: .infinity)
	}
	.primaryButton(isLoading: $isButtonLoading)
```
Primary button with custom appearance
```swift
	Button(action: {}) {
		HStack{
			Text("Custom font")
		}
	}
	.primaryButton(
		appearance: NitrozenAppearance.shared
			.primaryButton.copy
			.font(.system(size: 10).italic())
			.titleColor(.white)
			.backgroundColor(.black),
		viewPadding: .custom(paddingToAdd: .init(top: 20, leading: 80, bottom: 20, trailing: 80))
	)
```
Bordered button
```swift
	Button(action: {}) {
		Text("Click me")
	}
	.borderedButton()
```
Tertiary button
```swift
	Button(action: {}) {
		Text("Click me")
	}
	.tertiaryButton()
```


### 2. Text/Label/Font (will add code snippet here)
| Preview1 | Preview2 | Preview3 | Preview4 | Preview5 |
| ---      | ---       | ---       | ---       | ---       |
| <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/textLabelFont1.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/textLabelFont2.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/textLabelFont3.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/textLabelFont4.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/textLabelFont5.png" width="300"> |

### Text/Label/Font code snippets
All font variants applied on label/text
```swift
struct TextLabels: View {

	@State var isLoading: Bool = false
	
	var body: some View {
		List{
			
			Section {
				
				HStack{
					Text("Loading")
					Toggle("", isOn: $isLoading)
				}
				
				Text("With love, from Nitrozen-SwiftUI")
					.body(isLoading: $isLoading, size: .m, weight: .regular)
			}
			
			Section("Body XXS") {
				Text("With love, from Nitrozen-SwiftUI /bold")
					.body(size: .xxs, weight: .bold)
				
				Text("With love, from Nitrozen-SwiftUI /regular")
					.body(size: .xxs, weight: .regular)
				
				Text("With love, from Nitrozen-SwiftUI /link")
					.body(size: .xxs, weight: .link, color: .blue)
				
				Text("With love, from Nitrozen-SwiftUI /useDefault(medium)")
					.body(size: .xxs, weight: .useDefault)
			}
			
			Section("Body XS") {
				Text("With love, from Nitrozen-SwiftUI /bold")
					.body(size: .xs, weight: .bold)
				
				Text("With love, from Nitrozen-SwiftUI /regular")
					.body(size: .xs, weight: .regular)
				
				Text("With love, from Nitrozen-SwiftUI /link")
					.body(size: .xs, weight: .link, color: .blue)
				
				Text("With love, from Nitrozen-SwiftUI /useDefault(medium)")
					.body(size: .xs, weight: .useDefault)
			}
			
			Section("Body S") {
				Text("With love, from Nitrozen-SwiftUI /bold")
					.body(size: .s, weight: .bold)
				
				Text("With love, from Nitrozen-SwiftUI /regular")
					.body(size: .s, weight: .regular)
				
				Text("With love, from Nitrozen-SwiftUI /link")
					.body(size: .s, weight: .link, color: .blue)
				
				Text("With love, from Nitrozen-SwiftUI /useDefault(medium)")
					.body(size: .s, weight: .useDefault)
			}
			
			Section("Body M") {
				Text("With love, from Nitrozen-SwiftUI /bold")
					.body(size: .m, weight: .bold)
				
				Text("With love, from Nitrozen-SwiftUI /regular")
					.body(size: .m, weight: .regular)
				
				Text("With love, from Nitrozen-SwiftUI /link")
					.body(size: .m, weight: .link, color: .blue)
				
				Text("With love, from Nitrozen-SwiftUI /useDefault(medium)")
					.body(size: .m, weight: .useDefault)
			}
			
			Section("Body L") {
				Text("With love, from Nitrozen-SwiftUI /bold")
					.body(size: .l, weight: .bold)
				
				Text("With love, from Nitrozen-SwiftUI /regular")
					.body(size: .l, weight: .regular)
				
				Text("With love, from Nitrozen-SwiftUI /link")
					.body(size: .l, weight: .link, color: .blue)
				
				Text("With love, from Nitrozen-SwiftUI /useDefault(medium)")
					.body(size: .l, weight: .useDefault)
			}
			
			Section("Headings") {
				Text("With love, from Nitrozen-SwiftUI .xxs)")
					.heading(size: .xxs)
				
				Text("With love, from Nitrozen-SwiftUI .xs)")
					.heading(size: .xs)
				
				Text("With love, from Nitrozen-SwiftUI .s)")
					.heading(size: .s)
				
				Text("With love, from Nitrozen-SwiftUI .m)")
					.heading(size: .m)
				
				Text("With love, from Nitrozen-SwiftUI .l)")
					.heading(size: .l)
				
				Text("With love, from Nitrozen-SwiftUI .xl)")
					.heading(size: .xl)
			}
			
			Section {
				Text("Custom Appearance")
				
				Text("This is text/label with purple title color and custom font")
					.heading(size: .m, color: .purple)
			}
		}
	}
}
```


### 3. TextField (will add code snippet here)
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


### 4. Checkbox (will add code snippet here)

| Preview1 |
| ---      |
| <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/checkbox1.png" width="300"> |

### 5. Radio (will add code snippet here)

| Preview1 |
| ---      |
| <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/radio1.png" width="300"> |
