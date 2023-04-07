//
//  Checkboxes.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 05/04/23.
//

import SwiftUI
import Nitrozen_SwiftUI

struct Checkboxes: View {
	
	var options1: [String] = ["Male", "Female", "Other"]
	@State var selection1: Set<String> = ["Male"]
	
	var options2: [String] = ["O1", "O2", "O3"]
	@State var selection2: Set<String> = []
	
	var options3: [User] = User.users
	@State var selection3: Set<User> = []
	
	var body: some View {
		List{
			Section {
				Text("Verticle Checkbox")
				
				NitrozenCheckbox(
					options: self.options1, selection: $selection1,
					layout: .verticle)
					.frame(maxWidth: .infinity, alignment: .leading)
			}
			
			Section {
				Text("Horizontal Checkbox")
				
				NitrozenCheckbox(
					options: self.options2,
					selection: $selection2,
					layout: .horizontal,
					appearance: nil
				)
					.frame(maxWidth: .infinity, alignment: .leading)
			}
			
			Section {
				Text("Verticle Checkbox with custom Model and appearance")
				
				NitrozenCheckbox(
					options: self.options3, selection: $selection3,
					layout: .verticle,
					appearance:
						NitrozenAppearance.shared
						.checkbox.copy
						.selectedColor(.purple)
						.selectedTitle(NitrozenAppearance.shared.checkbox.selectedTitle.copy.titleColor(.purple))
				)
					.frame(maxWidth: .infinity, alignment: .leading)
			}
		}
	}
}

extension String: NitrozenElementStringSelectableStyle {
	public var selectionTitle: String { return self  }
}

struct User: Hashable {
	var name: String
	var id: UUID = UUID()
	var age: Int
	
	static var users: [User] = [
		.init(name: "Rushang", age: 28),
		.init(name: "Hitendra", age: 30),
		.init(name: "Keyur", age: 28)
	]
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}

extension User: NitrozenElementStringSelectableStyle {
	var selectionTitle: String {
		return self.name + " " + "Age: \(self.age)"
	}
}
