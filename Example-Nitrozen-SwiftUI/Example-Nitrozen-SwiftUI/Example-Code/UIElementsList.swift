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
					Text("Fonts + Text Labels")
				}
				
				NavigationLink {
					Checkboxes()
				} label: {
					Text("CheckBoxes")
				}
				
				NavigationLink {
					Alerts()
				} label: {
					Text("Alerts")
				}
                
                NavigationLink {
                    RadioButton()
                } label: {
                    Text("RadioButton")
                }
				
				NavigationLink {
					ActionSheet()
				} label: {
					Text("ActionSheet")
				}
				
				NavigationLink {
					PresentSheet()
				} label: {
					Text("PresentSheet")
				}
				
				NavigationLink {
					TagViews()
				} label: {
					Text("TagViews")
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
