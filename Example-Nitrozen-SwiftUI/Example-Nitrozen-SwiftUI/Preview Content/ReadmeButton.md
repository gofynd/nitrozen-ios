
## Button Preview

| Preview1 | Preview2 | Preview3 | Preview4 | Preview5 |
| ---      | ---       | ---       | ---       | ---       |
| <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/buttons1.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/buttons2.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/buttons3.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/buttons4.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/buttons5.png" width="300"> |

## Button code snippets
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
