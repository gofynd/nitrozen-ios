//
//  TextLabels.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 18/03/23.
//

import SwiftUI
import Nitrozen_SwiftUI

struct TextLabels: View {
	
	@State var isLoading: Bool = false
	
	var body: some View {
		List{
			
			Section {
				Text("With love, from Jio \n- headingXS")
					.headingXS()
				
				Text("With love, from Jio \n- headingXXS")
					.headingXXS()
				
				Text("With love, from Jio \n- subHeadingS")
					.subHeadingS()
				
				Text("With love, from Jio \n- bodyXS")
					.bodyXS()
				
				Text("With love, from Jio \n- labelXXS")
					.labelXXS()
			}
			
			Section {
				
				HStack{
					Text("Loading")
					Toggle("", isOn: $isLoading)
				}
				
				Text("With love, from Jio \n- headingXS")
					.headingXS(isLoading: $isLoading)
				
				Text("With love, from Jio \n- headingXXS")
					.headingXXS(isLoading: $isLoading)
				
				Text("With love, from Jio \n- subHeadingS")
					.subHeadingS(isLoading: $isLoading)
				
				Text("With love, from Jio \n- bodyXS")
					.bodyXS(isLoading: $isLoading)
				
				Text("With love, from Jio \n- labelXXS")
					.labelXXS(isLoading: $isLoading)
				
			}
		}
	}
}
