[![Swift](https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/Nitrozen-github-white.png)](https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/Nitrozen-github-white.png)

[![Swift](https://img.shields.io/badge/Swift-5%2B-blue)](https://img.shields.io/badge/Swift-5%2B-blue)
[![Platforms](https://img.shields.io/badge/Platforms-iOS-orange)](https://img.shields.io/badge/Platforms-iOS-orange)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)

Nitrozen-SwiftUI is a UILibrary, includes a set of common UI elements such as buttons, text fields, checkbox, and radio, among others, but with a high degree of flexibility and modularity that allows developers to easily modify the components to meet their specific design needs. These customization options may include changing the colors, fonts, and styles of the components, as well as adjusting the layout and behavior of the user interface.

## Basic Building blocks
### 1. Apperance
Apperance provide the styling to UIElement/control like colors, fonts, radius, shapes, padding, etc.
[![Apperance](https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/Nitrozen-apperance-architecture.png)](https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/Nitrozen-apperance-architecture.png)


### 2. Elements / UIControls
That takes apperance as optional inputs for its styling, and other inputs as per its requirements. Below are available elements. If optional apperance is not provided - it will use Appearance.shared.controlApperance for consistent styling.
[![Apperance](https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/Nitrozen-apperance-builder-pattern.png)](https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/Nitrozen-apperance-builder-pattern.png)


## Elements
#### [1. Button](https://github.com/hitendra-gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeButton.md)
#### [2. Text/Label/Font](https://github.com/hitendra-gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeTextLabelFont.md)
#### [3. TextField](https://github.com/hitendra-gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeTextField.md)
#### [4. Checkbox](https://github.com/hitendra-gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeCheckbox.md)
#### [5. Radio](https://github.com/hitendra-gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeRadio.md)

#### 6. Color Pallets - NitrozenAppearance.ColorProvider (Available - preview and code snippet coming soon)
#### 7. DropDown TextField - NitrozenDropDownTextField (Available - preview and code snippet coming soon)  
#### 8. TagView/Chip - NitrozenTagView (Available - preview and code snippet coming soon)
#### 9. Badge View - NitrozenTagView (Available - preview and code snippet coming soon)
#### 10. Switch/Toggle  - NitrozenToggle (Available - preview and code snippet coming soon)
#### 11. Progress Stepper - NitrozenPageControl (Available - preview and code snippet coming soon)


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


