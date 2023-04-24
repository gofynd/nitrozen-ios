//
//  EmptyView.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Keyur Patel on 20/04/23.
//

import SwiftUI
import Nitrozen_SwiftUI

struct EmptyView: View {
    var body: some View {
        
        List {
            
            Section {
                NitrozenEmptyView(
                    topView: AnyView(
                        Image(systemName: "bell.fill")
                            .padding(.top, 20)
                    ),
                    title: "You don’t have any notifications",
                    subTitle: "Notifications let you quickly catch up on any updates",
                    buttonTitle: "Go To Homepage") {
                        
                    }
            }
            
            Section {
                NitrozenEmptyView(
                    topView: AnyView(
                        Image(systemName: "shippingbox.fill")
                            .resizable()
                            .frame(width: 40,height: 40)
                    ),
                    title: "You’ve not received any order yet",
                    subTitle: "Come back and check again")
                
                .frame(maxWidth: .infinity)
            }
            
            Section {
                NitrozenEmptyView(
                    topView: AnyView(
                        Image(systemName: "list.bullet.rectangle.portrait.fill")
                            .resizable()
                            .frame(width: 100,height: 130)
                            .padding(.top, 20)
                    ),
                    title: "You’ve not generated a manifest yet",
                    subTitle: "Click on generate manifest to process",
                    buttonTitle: "Generate Manifest",
                    appearance: NitrozenAppearance.shared.emptyView.copy
                        .buttonPadding(.custom(paddingToAdd: .init(top: 50, leading: 20, bottom: 20, trailing: 20)))
                ) {
                    
                }
                
                .frame(maxWidth: .infinity)
            }

        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
