//
//  SegmentControls.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 20/04/23.
//

import SwiftUI
import Nitrozen_SwiftUI

struct SegmentControlViews: View {
	
	var options1: [String] = ["Item1", "Item2", "Item3"]
	@State var selection1: String = "Item2"
	
	var options2: [String] = ["Item1", "Item2", "Item3"]
	@State var selection2: String = "Item2"
	
	var options4: [String] = ["Home", "Office", "Shop", "Market", "Godown", "Truck"]
	@State var selection4: String = "Male"
	
	var options5: [String] = ["Item1", "Item2", "Item3"]
	@State var selection5: String = "Item2"

	var options6: [String] = ["Item1", "Item2", "Item3"]
	@State var selection6: String = "Item3"
	
	var options7: [String] = ["Activity", "DP Status"]
	@State var selection7: String = "Activity"
	
	var options8: [String] = ["Apple", "Banana", "Milk", "Pineapple", "Orange", "Green Apple", "Grapes"]
	@State var selection8: String = "Banana"
	
	var body: some View {
		List{
			
			
			Section("Segment Control with default apperance\n- full width - Custom fixed height") {
				NitrozenSegmentControl(options: self.options1, selection: $selection1)
					.padding(.bottom, 32)
			}
            .onTapGesture {
                self.selection1 = options1[Int.random(in: 0...2)]
            }
			
			Section("Scrollable Segment Control with default Underline apperance\n- Scrollable dynamic width - Custom fixed height\n- item dynamic width - fix item spacing") {
				NitrozenSegmentControl(
					options: self.options8,
					selection: $selection8,
					selectionStyle: .underline(height: 2),
                    userInteractionBehaviour: .scrollable(padding: .init(top: 0, leading: 16, bottom: 0, trailing: 16))
				)
				.padding(.bottom, 32)
                .padding(.horizontal, 0)
            }
            .onTapGesture {
                self.selection8 = options8[Int.random(in: 0...6)]
            }
			
			Section("Segment Control with default Underline apperance\n- full width - Custom fixed height\n- item infinity width - fix item spacing ") {
				NitrozenSegmentControl(
					options: self.options7,
					selection: $selection7,
					selectionStyle: .underline(height: 2)
				)
				.padding(.bottom, 32)
			}
			
			Section("Segment Control with custom apperance \n- Custom Fixed width - Custom fixed Height") {
				NitrozenSegmentControl(
					options: self.options2,
					selection: $selection2,
					appearance: NitrozenAppearance.shared
						.capsuleSegment.copy
						.itemSize(.init(width: CGFloat.infinity, height: 30))
						.itemSpacing(8)
				)
				.padding(.bottom, 32)
			}
			
			Section("Segment Control with default apprance\n- Custom View \n- full width - Custom fixed height") {
				NitrozenSegmentControl(
					options: options5,
					selection: $selection5,
					itemBuilder: { item, isSelected in
						
						HStack {
							Group {
								Image(systemName: "heart.fill")
								Text(item)
							}.if(isSelected) { group in
								group
									.font(NitrozenAppearance.shared.capsuleSegment.selectedTitleAppearance.font)
									.foregroundColor(NitrozenAppearance.shared.capsuleSegment.selectedTitleAppearance.titleColor)
							}.if(isSelected == false) { group in
								group
									.font(NitrozenAppearance.shared.capsuleSegment.titleAppearance.font)
									.foregroundColor(NitrozenAppearance.shared.capsuleSegment.titleAppearance.titleColor)
							}
							
						}
						
					},
					appearance: nil
				)
				.padding(.bottom, 32)
			}
			
			Section("Segment Control with custom apperance\n- Custom View \n- Custom Fixed width - Custom fixed Height") {
				NitrozenSegmentControl(
					options: options6,
					selection: $selection6,
					itemBuilder: { item, isSelected in
						
						VStack {
							Group {
								Image(systemName: "heart.fill")
								Spacer().frame(height: 10)
								Text(item)
							}.if(isSelected) { group in
								group
									.font(NitrozenAppearance.shared.capsuleSegment.selectedTitleAppearance.font)
									.foregroundColor(NitrozenAppearance.shared.capsuleSegment.selectedTitleAppearance.titleColor)
							}.if(isSelected == false) { group in
								group
									.font(NitrozenAppearance.shared.capsuleSegment.titleAppearance.font)
									.foregroundColor(NitrozenAppearance.shared.capsuleSegment.titleAppearance.titleColor)
							}
						}
					},
					appearance: NitrozenAppearance.shared
						.capsuleSegment.copy
						.itemSize(.init(width: 90, height: 60))
						.itemSpacing(8)
				)
				.padding(.bottom, 64)
				
			}
			
		}
	}
}
