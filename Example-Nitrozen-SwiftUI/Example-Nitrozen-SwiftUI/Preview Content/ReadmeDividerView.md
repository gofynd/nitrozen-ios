## Divider - Preview

| Preview1 |
| ---      |
| <img src="https://raw.githubusercontent.com/keyur-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/divider1.png" width="300"> |


## Divider code snippets
Divider with example
```swift
struct DeviderViews: View {

    var body: some View {
        List{
            
            Section {
                VStack {
                    Text("Default Nitrozen style")
                    NitrozenDivider()
                }
            }
            
            Section {
                VStack {
                    Text("Default Nitrozen style with horizontal layout\n- custom height, custom color")
                    NitrozenDivider(
                        appearance: NitrozenAppearance.shared
                            .divider.copy
                            .layout(.horizontal(height: 20))
                            .color(NitrozenAppearance.shared.colorProvider.warning50)
                            .shape(.capsule)
                    )
                }
            }
            
            Section {
                VStack {
                    Text("Default Nitrozen style with horizontal layout\n- custom height, custom color, custom shape")
                    NitrozenDivider(
                        appearance: NitrozenAppearance.shared
                            .divider.copy
                            .layout(.horizontal(height: 20))
                            .color(NitrozenAppearance.shared.colorProvider.success50)
                            .shape(.roundedRectangle(radius: 5))
                    )
                }
            }
            
            Section {
                VStack {
                    Text("Default Nitrozen style with verticle layout")
                    NitrozenDivider(
                        appearance: NitrozenAppearance.shared
                            .divider.copy
                            .layout(.verticle(width: 1))
                    )
                }
            }
            
            Section {
                VStack {
                    Text("Default Nitrozen style with verticle layout\n- custom width, custom color")
                    NitrozenDivider(
                        appearance: NitrozenAppearance.shared
                            .divider.copy
                            .layout(.verticle(width: 20))
                            .color(NitrozenAppearance.shared.colorProvider.warning50)
                            .shape(.capsule)
                    )
                }
            }
            
            Section {
                VStack {
                    Text("Default Nitrozen style with verticle layout\n- custom width, custom color, custom shape")
                    NitrozenDivider(
                        appearance: NitrozenAppearance.shared
                            .divider.copy
                            .layout(.verticle(width: 20))
                            .color(NitrozenAppearance.shared.colorProvider.success50)
                            .shape(.roundedRectangle(radius: 5))
                    )
                }
            }
            
        }
    }
}


```
