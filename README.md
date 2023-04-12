# Nitrozen-SwiftUI

## Elements
### 1. Button Previews

| Preview1 | Preview2 | Preview3 | Preview4 | Preview5 |
| ---      | ---       | ---       | ---       | ---       |
| <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/buttons1.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/buttons2.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/buttons3.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/buttons4.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/buttons5.png" width="300"> |

### Button code snippets
Primary button
```
	Button(action: {}) {
		Text("Click me")
			.frame(maxWidth: .infinity)
	}
	.primaryButton()
```
Primary Disable button
```
	Button(action: {}) {
		Text("Click me")
			.frame(maxWidth: .infinity)
	}
	.disabled(true)
	.primaryButton()
```
Primary loading button
```
	@State var isButtonLoading: Bool = false //declare state boolean at view level
	
	Button(action: {}) {
		Text("Click me")
			.frame(maxWidth: .infinity)
	}
	.primaryButton(isLoading: $isButtonLoading)
```
Primary button with custom appearance
```
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
```
	Button(action: {}) {
		Text("Click me")
	}
	.borderedButton()
```
Tertiary button
```
	Button(action: {}) {
		Text("Click me")
	}
	.tertiaryButton()
```


### 2. Text/Label/Font (will add code snippet here)
| Preview1 | Preview2 | Preview3 | Preview4 | Preview5 |
| ---      | ---       | ---       | ---       | ---       |
| <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/textLabelFont1.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/textLabelFont2.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/textLabelFont3.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/textLabelFont4.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/textLabelFont5.png" width="300"> |


### 3. TextField (will add code snippet here)
| Preview1 | Preview2 |
| ---      | ---       |
| <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/textfield1.png" width="300"> | <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/textfield2.png" width="300"> |

### 4. Checkbox (will add code snippet here)

| Preview1 |
| ---      |
| <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/checkbox1.png" width="300"> |

### 5. Radio (will add code snippet here)

| Preview1 |
| ---      |
| <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/radio1.png" width="300"> |
