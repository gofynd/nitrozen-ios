//
//  AvatarView.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Keyur Patel on 20/04/23.
//

import SwiftUI
import Nitrozen_SwiftUI

struct AvatarView: View {
    
    var users: [User] = User.users
    
    var body: some View {
        
        List {
            
            Section {
                Text("Avatar view with Initials from Text with default setting")

                HStack {
                    ForEach(users) { user in
                        VStack {
                            NitrozenAvatar(
                                mainView: .text(user.name)
                            )
                            Text(user.name)
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                
                        }
                        .frame(width: 80)
                    }
                }
            }
            
            Section {
                Text("Avatar view with Custom background and text color for Initials view")

                HStack {
                    ForEach(users) { user in
                        VStack {
                            if user == users.first{
                                NitrozenAvatar(
                                    mainView: .text(user.name),
                                    appearance: NitrozenAppearance.shared.avatar.copy
                                        .backgroundColor(ColorProvider.shared.primary20)
                                        .textStyle(NitrozenAppearance.TextLabel.init(titleColor: .green, font: .nitrozen(.body(size: .l, weight: .bold))))
                                )
                            } else if user == users.last {
                                NitrozenAvatar(
                                    mainView: .text(user.name),
                                    appearance: NitrozenAppearance.shared.avatar.copy
                                        .backgroundColor(ColorProvider.shared.gray100)
                                        .textStyle(NitrozenAppearance.TextLabel.init(titleColor: .white, font: .nitrozen(.heading(size: .s))))
                                )
                            } else {
                                NitrozenAvatar(
                                    mainView: .text(user.name),
                                    appearance: NitrozenAppearance.shared.avatar.copy
                                        .backgroundColor(ColorProvider.shared.secondary50)
                                        .borderWidth(4)
                                        .borderColor(ColorProvider.shared.sparkle20)
                                )
                            }
                            
                            Text(user.name)
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                
                        }
                        .frame(width: 80)
                    }
                }
            }
            
            Section {
                Text("Avatar view with system and asset image")
                
                HStack {
                    NitrozenAvatar(
                        mainView: .assetImage(name: "person_1")
                    )
                    
                    NitrozenAvatar(
                        mainView: .systemImage(name: "person")
                    )
                }
            }
            
            Section {
                
                Text("Avatar view with image from url")
                
                NitrozenAvatar(
                    mainView: .custom(view: AnyView(

                        AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")!,
                                   content: { img in
                                       img.resizable().scaledToFill()
                                   }, placeholder: {
                                       ProgressView()
                                   })
                        
                     
                    )),
                    appearance: NitrozenAppearance.shared.avatar.copy
                        .size(CGSize.init(width: 100, height: 100))
                )
            }
            
            Section {
                Text("Avatar view with rectangle or capsule shape")
                HStack {
                    NitrozenAvatar(
                        mainView: .text("14233"),
                        appearance: NitrozenAppearance.shared.avatar.copy
                            .viewShape(.roundedRectangle(radius: 10))
                    )
                    
                    NitrozenAvatar(
                        mainView: .assetImage(name: "person_1"),
                        appearance: NitrozenAppearance.shared.avatar.copy
                            .size(CGSize.init(width: 100, height: 50))
                            .viewShape(.capsule)
                    )
                }
            }
            
            Section {
                Text("Avatar view in disable state")
                HStack {
                    NitrozenAvatar(
                        mainView: .text("Abcd"),
                        isDisable: true
                    )
                }
            }
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
