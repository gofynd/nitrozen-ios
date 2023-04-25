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
            NavigationLink("Option 1") {
                EmptyViewOption1()
            }
            
            NavigationLink("Option 2") {
                EmptyViewOption2()
            }
            
            NavigationLink("Option 3") {
                EmptyViewOption3()
            }
            
            NavigationLink("Option 4") {
                EmptyViewOption4()
            }

        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}

struct EmptyViewOption1: View{
    var body: some View {
        NitrozenEmptyView(
            topView: .custom(view: AnyView(
                Image(systemName: "bell.fill")
                    .padding(.top, 20)
            )),
            title: "You don’t have any notifications",
            subTitle: "Notifications let you quickly catch up on any updates",
            buttonTitle: "Go To Homepage") {
                
            }
        
    }
}

struct EmptyViewOption2: View{
    var body: some View {
        NitrozenEmptyView(
            topView: .custom(view: AnyView(
                Image(systemName: "shippingbox.fill")
                    .resizable()
                    .frame(width: 40,height: 40)
            )),
            title: "You’ve not received any order yet",
            subTitle: "Come back and check again")
        
        .frame(maxWidth: .infinity)
    }
}

struct EmptyViewOption3: View{
    var body: some View {
        NitrozenEmptyView(
            topView: .custom(view: AnyView(
                Image(systemName: "list.bullet.rectangle.portrait.fill")
                    .resizable()
                    .foregroundColor(ColorProvider.shared.gray40)
                    .frame(width: 100,height: 130)
                    .padding(.top, 20)
            )),
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

struct EmptyViewOption4: View{
    var body: some View {
        NitrozenEmptyView(
            topView: .custom(view: AnyView(
                Image(systemName: "list.bullet.rectangle.portrait")
                    .resizable()
                    .foregroundColor(ColorProvider.shared.gray40)
                    .frame(width: 100,height: 130)
                    .padding(.top, 20)
            )),
            title: "No Products Exist", actions: {
            VStack(spacing: 0) {
                Text("Add product to sell online")
                    .body(size: .xs, weight: .regular, color: ColorProvider.shared.gray80)
                    .padding()
                
                Button {
                    
                } label: {
                    Text("Add Product")
                }
                .borderedButton()
                .padding()
            }
        })
        
        .frame(maxWidth: .infinity)
    }
}

