[![Swift](https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/Nitrozen-github-white.png)](https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/Nitrozen-github-white.png)

[![Swift](https://img.shields.io/badge/Swift-5%2B-blue)](https://img.shields.io/badge/Swift-5%2B-blue)
[![Platforms](https://img.shields.io/badge/Platforms-iOS-orange)](https://img.shields.io/badge/Platforms-iOS-orange)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)

Nitrozen-SwiftUI is a UILibrary, includes a set of common UI elements such as buttons, text fields, checkbox, and radio, among others, but with a high degree of flexibility and modularity that allows developers to easily modify the components to meet their specific design needs. These customization options may include changing the colors, fonts, and styles of the components, as well as adjusting the layout and behavior of the user interface.

## Basic Building blocks
### a. Apperance
Apperance provide the styling to UI element/control like colors, fonts, radius, shapes, padding, etc.
[![Apperance](https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/Nitrozen-apperance-architecture.png)](https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/Nitrozen-apperance-architecture.png)


### b. UI Elements/Controls
That takes apperance as optional inputs for its styling, and other inputs as per its requirements. If optional apperance is not provided - it will use Appearance.shared.controlApperance for consistent styling.
[![Apperance](https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/Nitrozen-apperance-builder-pattern.png)](https://raw.githubusercontent.com/hitendra-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/Nitrozen-apperance-builder-pattern.png)


## Elements
* [Action Sheet 🆕](https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeActionSheet.md)
* [Alert 🆕](https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeAlert.md)
* [Avatar 🆕](https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeAvatar.md)
* [Badge View](https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeBadge.md)
* [Button](https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeButton.md)
* [Checkbox](https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeCheckbox.md)
* [Color Pallets](https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeColors.md)
* [DropDown TextField](https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeDropdownTextfield.md)
* [DividerView 🆕](https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeDividerView.md)
* [EmptyView 🆕](https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeEmptyView.md)
* [OTPView 🆕](https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeOTPView.md)
* [Page Control 🆕](https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmePageControl.md)
* [Progress Stepper](https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeProgressStepper.md)
* [Progress View 🆕](https://github.com/hitendra-gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeProgressView.md)

* [Radio](https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeRadio.md)
* [Segment Control 🆕](https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeSegmentControl.md)
* [StepperView 🆕](https://github.com/gofynd/nitrozen-ios/blob/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/ReadmeStepperView.md)


## Contributors

- [Hitendra Solanki](https://github.com/hitendradeveloper)
- [Rushang Prajapati](https://github.com/Rushang08)
- [Keyur Patel](https://github.com/KeyurPatel-1)

## Requirements

| Platform | Minimum Swift Version | Installation | Status |
| --- | --- | --- | --- |
| iOS 13.0+ | 5.0 | [Swift Package Manager](#swift-package-manager) | Fully Tested |

## How to install? - via Swift Package Manager

The  [Swift Package Manager](https://swift.org/package-manager/)  is a tool for automating the distribution of Swift code and is integrated into the  `swift`  compiler.

Once you have your Swift package set up, adding Nitrozen-SwiftUI as a dependency is as easy as adding it to the  `dependencies`  value of your  `Package.swift`.

```
dependencies: [
    .package(url: "https://github.com/gofynd/nitrozen-ios.git", branch: "master")
]
```

## How to Contribute?

1. Fork Repo and Create PR.
2. We will review your PR, if PR will be merged successfully, your name will visible under the contributors list. Happy coding :)

## License

Nitrozen-SwiftUI is released under the MIT license.
