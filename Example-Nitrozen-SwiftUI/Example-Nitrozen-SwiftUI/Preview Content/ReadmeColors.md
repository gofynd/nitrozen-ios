
## Colors - NitrozenApperance.ColorProvider - Preview

| Preview1 |
| ---      |
| <img src="https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/colors1.png" width="300"> |

## Colors code snippets

### How to access?
```swift
	NitrozenApperance.shared.colorProvider.primary50
```

### All available color properties in below snippet

```swift

public class ColorProvider {
	
	//MARK: public properties
	public var primary50: SystemColor
	public var primaryInverse: SystemColor
	
	public var secondary50: SystemColor
	public var secondaryInverse: SystemColor
	
	public var sparkle50: SystemColor
	public var sparkleInverse: SystemColor
	
	public var gray100: SystemColor
	public var error50: SystemColor
	public var success50: SystemColor
	public var warning50: SystemColor
	public var primaryBackground: SystemColor
	public var pageBackground: SystemColor
	
	
	//MARK: Init
	public init(primary50: SystemColor, primaryInverse: SystemColor,
		 secondary50: SystemColor, secondaryInverse: SystemColor,
		 sparkle50: SystemColor, sparkleInverse: SystemColor,
		 
		 gray100: SystemColor,
		 
		 error50: SystemColor, success50: SystemColor, warning50: SystemColor,
		 
		 primaryBackground: SystemColor, pageBackground: SystemColor
	) {
		self.primary50 = primary50
		self.primaryInverse = primaryInverse
		self.secondary50 = secondary50
		self.secondaryInverse = secondaryInverse
		self.sparkle50 = sparkle50
		self.sparkleInverse = sparkleInverse
		self.gray100 = gray100
		self.error50 = error50
		self.success50 = success50
		self.warning50 = warning50
		self.primaryBackground = primaryBackground
		self.pageBackground = pageBackground
	}
	
	public var primary80:  SystemColor { Color(self.primary50.uiColor().darker(percentage: 30)) }
	public var primary70:  SystemColor { Color(self.primary50.uiColor().darker(percentage: 20)) }
	public var primary60:  SystemColor { Color(self.primary50.uiColor().darker(percentage: 10)) }
	//var primary50:  SystemColor
	public var primary40:  SystemColor { Color(self.primary50.uiColor().lighter(percentage: 10)) }
	public var primary30:  SystemColor { Color(self.primary50.uiColor().lighter(percentage: 20)) }
	public var primary20:  SystemColor { Color(self.primary50.uiColor().lighter(percentage: 30)) }
	
	public var sparkle80:  SystemColor { Color(self.sparkle50.uiColor().darker(percentage: 30)) }
	public var sparkle70:  SystemColor { Color(self.sparkle50.uiColor().darker(percentage: 20)) }
	public var sparkle60:  SystemColor { Color(self.sparkle50.uiColor().darker(percentage: 10)) }
	//var sparkle50:  SystemColor
	public var sparkle40:  SystemColor { Color(self.sparkle50.uiColor().lighter(percentage: 10)) }
	public var sparkle30:  SystemColor { Color(self.sparkle50.uiColor().lighter(percentage: 20)) }
	public var sparkle20:  SystemColor { Color(self.sparkle50.uiColor().lighter(percentage: 30)) }
	
	public var secondary80:  SystemColor { Color(self.secondary50.uiColor().darker(percentage: 30)) }
	public var secondary70:  SystemColor { Color(self.secondary50.uiColor().darker(percentage: 20)) }
	public var secondary60:  SystemColor { Color(self.secondary50.uiColor().darker(percentage: 10)) }
	//var secondary50:  SystemColor
	public var secondary40:  SystemColor { Color(self.secondary50.uiColor().lighter(percentage: 10)) }
	public var secondary30:  SystemColor { Color(self.secondary50.uiColor().lighter(percentage: 20)) }
	public var secondary20:  SystemColor { Color(self.secondary50.uiColor().lighter(percentage: 30)) }
	
	//var gray100: SystemColor
	public var gray80:  SystemColor { Color(self.gray100.uiColor().lighter(percentage: 20)) }
	public var gray60:  SystemColor { Color(self.gray100.uiColor().lighter(percentage: 40)) }
	public var gray40:  SystemColor { Color(self.gray100.uiColor().lighter(percentage: 60)) }
	public var gray20:  SystemColor { Color(self.gray100.uiColor().lighter(percentage: 80)) }
	
	public var error80:  SystemColor { Color(self.error50.uiColor().darker(percentage: 30)) }
	//public var error50: SystemColor
	public var error20:  SystemColor { Color(self.error50.uiColor().lighter(percentage: 30)) }
	
	public var success80:  SystemColor { Color(self.success50.uiColor().darker(percentage: 30)) }
	//public var success50: SystemColor
	public var success20:  SystemColor { Color(self.success50.uiColor().lighter(percentage: 30)) }
	
	public var warning80:  SystemColor { Color(self.warning50.uiColor().darker(percentage: 30)) }
	//public var warning50: SystemColor
	public var warning20:  SystemColor { Color(self.warning50.uiColor().lighter(percentage: 30)) }
}


```
