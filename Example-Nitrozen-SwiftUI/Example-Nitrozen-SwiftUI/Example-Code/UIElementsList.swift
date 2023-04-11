//
//  UIElementsList.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 28/12/22.
//

import SwiftUI
import Nitrozen_SwiftUI

struct UIElementsList: View {
	
	@State var currentPage: Int = 4
	
	var body: some View {
		NavigationStack {
			List {
				Group {
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
				}
				
				
				Group {
					NavigationLink {
						Checkboxes()
					} label: {
						Text("CheckBoxes")
					}
					
					NavigationLink {
						RadioButton()
					} label: {
						Text("RadioButton")
					}
					
					NavigationLink {
						Alerts()
					} label: {
						Text("Alerts")
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
				}
				
				NavigationLink {
					TagViews()
				} label: {
					Text("TagViews")
				}
				
				NavigationLink {
					PageControls()
				} label: {
					Text("Page Congrol")
				}
				
				
				NavigationLink {
					BadgeViews()
				} label: {
					Text("Badge Views")
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
