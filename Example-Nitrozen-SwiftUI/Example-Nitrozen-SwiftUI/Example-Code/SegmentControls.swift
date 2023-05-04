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
			
			Section("Scrollable Segment Control with custom apperance\n- Scrollable dynamic width - Custom fixed height\n- item dynamic width - fix item spacing") {
				NitrozenSegmentControl(
					options: self.options8,
					selection: $selection8,
					selectionStyle: .underline,
					isScrollableEnabled: true,
					appearance: NitrozenAppearance.shared
						.segment.copy
						.titleAppearance(.init(titleColor: ColorProvider.shared.gray60, font: .nitrozen(.body(size: .s, weight: .useDefault))))
						.selectedTitleAppearance(.init(titleColor: ColorProvider.shared.gray100, font: .nitrozen(.body(size: .s, weight: .useDefault))))
						.backgroundColor(.clear)
						.selectedBackgroundColor(ColorProvider.shared.primary50)
						.viewShape(.none)
						.itemSize(.init(width: CGFloat.infinity, height: 42))
						.itemSpacing(16)
						.backgroundPadding(.zero)
						.viewShape(.roundedRectangle(radius: 0))
						.borderWidth(0)
				)
				.padding(.bottom, 32)
			}
			
			Section("Segment Control with custom apperance\n- full width - Custom fixed height\n- item infinity width - fix item spacing ") {
				NitrozenSegmentControl(
					options: self.options7,
					selection: $selection7,
					selectionStyle: .underline,
					appearance: NitrozenAppearance.shared
						.segment.copy
						.titleAppearance(.init(titleColor: ColorProvider.shared.gray60, font: .nitrozen(.body(size: .s, weight: .useDefault))))
						.selectedTitleAppearance(.init(titleColor: ColorProvider.shared.gray100, font: .nitrozen(.body(size: .s, weight: .useDefault))))
						.backgroundColor(.clear)
						.selectedBackgroundColor(ColorProvider.shared.primary50)
						.itemSize(.init(width: CGFloat.infinity, height: 42))
						.itemSpacing(8)
						.backgroundPadding(.zero)
						.viewShape(.roundedRectangle(radius: 0))
						.borderWidth(0)
				)
				.padding(.bottom, 32)
			}
			
			Section("Segment Control with custom apperance \n- Custom Fixed width - Custom fixed Height") {
				NitrozenSegmentControl(
					options: self.options2,
					selection: $selection2,
					appearance: NitrozenAppearance.shared
						.segment.copy
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
									.font(NitrozenAppearance.shared.segment.selectedTitleAppearance.font)
									.foregroundColor(NitrozenAppearance.shared.segment.selectedTitleAppearance.titleColor)
							}.if(isSelected == false) { group in
								group
									.font(NitrozenAppearance.shared.segment.titleAppearance.font)
									.foregroundColor(NitrozenAppearance.shared.segment.titleAppearance.titleColor)
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
									.font(NitrozenAppearance.shared.segment.selectedTitleAppearance.font)
									.foregroundColor(NitrozenAppearance.shared.segment.selectedTitleAppearance.titleColor)
							}.if(isSelected == false) { group in
								group
									.font(NitrozenAppearance.shared.segment.titleAppearance.font)
									.foregroundColor(NitrozenAppearance.shared.segment.titleAppearance.titleColor)
							}
						}
					},
					appearance: NitrozenAppearance.shared
						.segment.copy
						.itemSize(.init(width: 90, height: 60))
						.itemSpacing(8)
				)
				.padding(.bottom, 64)
				
			}
			
		}
	}
}
