//
//  Checkboxes.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 05/04/23.
//


import SwiftUI
import Nitrozen_SwiftUI

extension String: NitrozenElementStringSelectableStyle {
	public var selectionTitle: String { return self  }
}



struct Checkboxes: View {
	
	var options1: [String] = ["Male", "Female", "Other"]
	@State var selection1: Set<String> = ["Male"]
	
	var options2: [String] = ["O1", "O2", "O3"]
	@State var selection2: Set<String> = []
	
	
	var body: some View {
		List{
			Section {
				Text("Horizontal Checkbox")
				
				NitrozenCheckbox(options: self.options1, selection: $selection1, layout: .verticle, appearance: nil)
					.frame(maxWidth: .infinity, alignment: .leading)
			}
			
			Section {
				Text("Verticle Checkbox")
				
				NitrozenCheckbox(options: self.options2, selection: $selection2, layout: .horizontal, appearance: nil)
					.frame(maxWidth: .infinity, alignment: .leading)
			}
		}
	}
}
