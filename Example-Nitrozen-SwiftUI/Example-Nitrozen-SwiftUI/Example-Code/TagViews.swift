//
//  TagViews.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 08/04/23.
//

import SwiftUI
import Nitrozen_SwiftUI

struct TagViews: View {
	
	var options1: [String] = ["Male", "Female", "Other"]
	@State var selection1: Set<String> = ["Male"]
	
	var options3: [User] = User.users
	@State var selection3: Set<User> = []
	
	var options2: [String] = ["Home", "Office", "Shop"]
	@State var selection2: Set<String> = []
	
	var body: some View {
		List{
			
			Section {
				Text("Single tag selection")
				
				NitrozenTagView(
					options: options1, selection: $selection1,
					spacing: 8, allowedSelection: .single
				)
			}
			
			Section {
				Text("Multi tag selection with custom view")
				
				NitrozenTagView(
					options: options3, selection: $selection3,
					spacing: 8, allowedSelection: .multiple) { option, isSelected in
						
						HStack {
							VStack {
								HStack {
									Image(systemName: "person")
										.resizable()
										.aspectRatio(contentMode: .fit)
										.frame(width: 20, height: 20)
									Text(option.name)
								}
								HStack {
									Image(systemName: "person.2.wave.2")
										.resizable()
										.aspectRatio(contentMode: .fit)
										.frame(width: 20, height: 20)
									Text("Age: " + "\(option.age)")
								}
							}
							.foregroundColor(isSelected ? .blue : .black)
						}
						.padding(.horizontal)
					}
			}
		}
	}
}

extension String: Identifiable {
	public var id: String { return self }
}

extension User: Identifiable {}

