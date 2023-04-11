//
//  BadgeViews.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 11/04/23.
//

import SwiftUI
import Nitrozen_SwiftUI

struct BadgeViews: View {
	
	var body: some View {
		List{
			
			
			Section {
				VStack(alignment: .leading) {
					Text("BadgeView: TagViewItem as single view\n- default text item \n- custom radius, color, font, border, padding")
					
					NitrozenTagViewItem(
						titleView: .nitrozen(text: "v1.3.2"),
						shape: .roundedRectangle(radius: 6),
						appearance: NitrozenAppearance.shared
							.tagView.copy
							.deSelectedTitle(.init(titleColor: .orange, font: .nitrozen(.body(size: .xxs, weight: .regular))))
							.deselectedBorderColor(.orange)
							.deselectedBorderWidth(1.0)
							.deSelectedBackgroundColor(.orange.opacity(0.2))
							.padding(.custom(paddingToAdd: .init(top: 4, leading: 6, bottom: 4, trailing: 6)))
					)
				}
			}
			
			Section {
				VStack(alignment: .leading) {
					Text("BadgeView:\n- default text item \n- no border, custom radius, color, font, padding")
					
					NitrozenTagViewItem(
						titleView: .nitrozen(text: "KYC Pending"),
						shape: .roundedRectangle(radius: 6),
						appearance: NitrozenAppearance.shared
							.tagView.copy
							.deSelectedTitle(.init(titleColor: Color(UIColor(red: 0.489, green: 0.184, blue: 0.031, alpha: 1)), font: .nitrozen(.body(size: .xxs, weight: .useDefault))))
							.deselectedBorderColor(.clear)
							.deselectedBorderWidth(0.0)
							.deSelectedBackgroundColor(Color(UIColor(red: 0.996, green: 0.941, blue: 0.906, alpha: 1)))
							.padding(.custom(paddingToAdd: .init(top: 4, leading: 8, bottom: 4, trailing: 8)))
					)
				}
			}
			
			Section {
				VStack(alignment: .leading) {
					Text("BadgeView:\n- Custom view \n- no border, custom radius, color, font, padding")
					
					NitrozenTagViewItem(
						titleView: .custom(
							view: AnyView(
								HStack {
									Image(systemName: "clock.circle")
									Text("Apr 03, 2023  04:20 PM")
								}
									.font(.nitrozen(.body(size: .xxs, weight: .useDefault)))
									.foregroundColor(Color(UIColor(red: 0.403, green: 0.321, blue: 0.157, alpha: 1)))
							)
						),
						shape: .roundedRectangle(radius: 4),
						appearance: NitrozenAppearance.shared
							.tagView.copy
							.deSelectedTitle(.init(titleColor: Color(UIColor(red: 0.489, green: 0.184, blue: 0.031, alpha: 1)), font: .nitrozen(.body(size: .xxs, weight: .useDefault))))
							.deselectedBorderColor(.clear)
							.deselectedBorderWidth(0.0)
							.deSelectedBackgroundColor(Color(UIColor(red: 0.996, green: 0.941, blue: 0.906, alpha: 1)))
							.padding(.custom(paddingToAdd: .init(top: 4, leading: 8, bottom: 4, trailing: 8)))
					)
				}
			}
			
			
			
		}
	}
}
