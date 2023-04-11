//
//  RadioButton.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Rushang Prajapati on 05/04/23.
//

import SwiftUI
import Nitrozen_SwiftUI

struct RadioButton: View {
	
	var options1: [String] = ["Male", "Female", "Other"]
	@State var selection1: Set<String> = ["Male"]
	
	var options2: [String] = ["O1", "O2", "O3"]
	@State var selection2: Set<String> = ["O1"]
	
	var options3: [User] = User.users
	@State var selection3: Set<User> = []
	
	@State var isSelected: Bool = true
	
	var body: some View {
		List{
			Section(selection1.first ?? "") {
				Text("Horizontal RadioButton With Title")
				NitrozenRadio(
					options: self.options1, selection: $selection1,
					layout: .horizontal)
				.frame(maxWidth: .infinity, alignment: .leading)
			}
			
			Section(selection2.first ?? "") {
				Text("Vetical RadioButton With Title\n- custom spacing")
				NitrozenRadio(
					options: self.options2, selection: $selection2,
					layout: .verticle, itemSpacing: 2)
				.frame(maxWidth: .infinity, alignment: .leading)
			}
			
			Section(selection3.first?.name ?? "") {
				
				Text("Vertical RadioButton With Title and Subtitle | Custom Model")
				NitrozenRadio(
					options: self.options3,
					selection: $selection3,
					layout: .verticle
				)
				
			}
			
			Section {
				
				Text("Vertical with only RadioButton")
				NitrozenRadioButtonItem(isSelected: isSelected)
				
			}
			
		}
	}
}

extension User: NitrozenElementRadioStringSelectableStyle  {
	var selectionSubTitleText: String? {
		return "Age: \(self.age)"
	}
	var selectionTitleText: String {
		return self.name
	}
}

extension String: NitrozenElementRadioStringSelectableStyle {
	public var selectionTitleText: String { return self  }
	public var selectionSubTitleText: String? { return ""  }
}

