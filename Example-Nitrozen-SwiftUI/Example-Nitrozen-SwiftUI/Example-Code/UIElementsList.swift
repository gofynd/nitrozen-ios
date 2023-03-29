//
//  UIElementsList.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 28/12/22.
//

import SwiftUI

struct UIElementsList: View {
	
	var body: some View {
		NavigationStack {
			List {
				NavigationLink {
					Buttons()
				} label: {
					Text("Buttons")
				}
				
				NavigationLink {
					TextFields()
				} label: {
					Text("Textfields")
				}
				
				NavigationLink {
					DropDownTextField()
				} label: {
					Text("DropDown TextField")
				}
				
				NavigationLink {
					TextLabels()
				} label: {
					Text("TextLabels")
				}

			}
			.navigationTitle("Nitrozen Elements")
		}

	}
}

struct UIElementsList_Preview: PreviewProvider {
	static var previews: some View {
		UIElementsList()
			.previewDevice(PreviewDevice.init(stringLiteral: "iPhone 14 Pro"))
	}
}
