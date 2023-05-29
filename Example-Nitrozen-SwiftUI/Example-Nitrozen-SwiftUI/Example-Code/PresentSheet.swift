//
//  PresentSheet.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Rushang Prajapati on 07/04/23.
//

import Foundation
import SwiftUI
import Nitrozen_SwiftUI

struct PresentSheet: View {
	
	var options: [ActionOptions] = ActionOptions.options
	@State var showingRadioButton = false
	@State var showingActionSheet = false
	@State var showingCheckBox = false
	
	var options1: [String] = ["Male", "Female", "Other"]
	@State var selection1: Set<String> = ["Male"]
	
	
	var options2: [String] = ["L", "XL", "M" , "S" , "XXL"]
	@State var selection2: Set<String> = []
	
	
	
	@State var nitrozenSheetTriggerDataForChild1: ChildViewLevel1.NitrozenSheetTriggerData = .init(isShowing: false)
	@State var nitrozenSheetTriggerDataForChild2: ChildViewLevel2.NitrozenSheetTriggerData = .init(isShowing: false)
	
	var body: some View {
		List{
			Section {
				Text("PresentSheet with ActionSheet")
					.onTapGesture {
						self.showingActionSheet.toggle()
					}
			}
			
			Section {
				Text("PresentSheet with RadioButton")
					.onTapGesture {
						self.showingRadioButton.toggle()
					}
			}
			
			Section {
				Text("PresentSheet with CheckBox")
					.onTapGesture {
						self.showingCheckBox.toggle()
					}
			}
			
			Section("PresentSheet - trigger from Child view") {
				VStack {
					Text("View Level - 0")
						.frame(maxWidth: .infinity, alignment: .leading)

					ChildViewLevel1(
						nitrozenSheetTriggerDataFromParent: $nitrozenSheetTriggerDataForChild1,
						nitrozenSheetTriggerDataFromParentForLevel2: $nitrozenSheetTriggerDataForChild2
					)
				}
			}
			
			
		}
		.nitrozenSheet(isPresented: $showingActionSheet, postion: .bottom) {
			NitrozenActionSheet(
				title: "Select Profile Picture",
				isShowing:$showingActionSheet,
				closeView: NitrozenActionSheet.CustomView.nitrozen,
				content: {
					VStack(alignment: .leading, spacing: 12){
						ForEach(options) { option in
							HStack(alignment: .top) {
								Image(systemName: option.icon)
								Text(option.name)
									.body(size: .s, weight: .regular)
									.foregroundColor(.gray)
								Spacer()
							}
							.frame(height: 30.0)
							.padding(0)
							.onTapGesture {
								self.showingActionSheet.toggle()
							}
						}
						
					}
					.padding([.top,.bottom], 10)
					
				})
			
		}
		
		.nitrozenSheet(isPresented: $showingRadioButton, postion: .bottom, content: {
			NitrozenActionSheet(
				title: "Select Gender",
				subTitle: "Its not good to ask gender but it would be great if you provide us!! ",
				isShowing:$showingRadioButton,
				closeView: NitrozenActionSheet.CustomView.nitrozen,
				content: {
					NitrozenRadio(
						options: self.options1, selection: $selection1,
						layout: .verticle)
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding([.top,.bottom], 10)
					
					Button {
						self.showingRadioButton.toggle()
					} label: {
						Text("Select")
							.frame(maxWidth: .infinity)
					}
					.primaryButton()
					.padding(.vertical, 5)
					
					
				})
			
		})
		
		.nitrozenSheet(isPresented: $showingCheckBox, postion: .bottom) {
			NitrozenActionSheet(
				title: "Select Tshirt Size",
				isShowing:$showingCheckBox,
				closeView: NitrozenActionSheet.CustomView.nitrozen,
				content: {
					NitrozenCheckbox(
						options: self.options2, selection: $selection2,
						layout: .verticle)
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding([.top,.bottom], 10)
					
					Button {
						self.showingCheckBox.toggle()
					} label: {
						Text("Select")
							.frame(maxWidth: .infinity)
					}
					.primaryButton()
					.padding(.vertical, 5)
					
				})
			
		}
		
		.nitrozenSheet(isPresented: $nitrozenSheetTriggerDataForChild1.isShowing, postion: .bottom) {
			NitrozenActionSheet(
				title: "Select Gender - from child view level 1",
				subTitle: "Its not good to ask gender but it would be great if you provide us!",
				isShowing: $nitrozenSheetTriggerDataForChild1.isShowing,
				closeView: NitrozenActionSheet.CustomView.nitrozen,
				content: {
					NitrozenRadio(
						options: nitrozenSheetTriggerDataForChild1.options, selection: $nitrozenSheetTriggerDataForChild1.selection,
						layout: .verticle)
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding([.top,.bottom], 10)
					
					Button {
						nitrozenSheetTriggerDataForChild1.isShowing.toggle()
					} label: {
						Text("Select")
							.frame(maxWidth: .infinity)
					}
					.primaryButton()
					.padding(.vertical, 5)
				})
			}
		
		.nitrozenSheet(isPresented: $nitrozenSheetTriggerDataForChild2.isShowing, postion: .bottom) {
			NitrozenActionSheet(
				title: "Select Tshirt Size - from child view level 2",
				isShowing:$nitrozenSheetTriggerDataForChild2.isShowing,
				closeView: NitrozenActionSheet.CustomView.nitrozen,
				content: {
					NitrozenCheckbox(
						options: nitrozenSheetTriggerDataForChild2.options, selection: $nitrozenSheetTriggerDataForChild2.selection,
						layout: .verticle)
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding([.top,.bottom], 10)
					
					Button {
						nitrozenSheetTriggerDataForChild2.isShowing.toggle()
					} label: {
						Text("Select")
							.frame(maxWidth: .infinity)
					}
					.primaryButton()
					.padding(.vertical, 5)
					
				})
			}
	}
}


struct ChildViewLevel1: View {
	
	struct NitrozenSheetTriggerData {
		var isShowing: Bool
		var options: [String] = ["Male", "Female", "Other"]
		var selection: Set<String> = ["Male"]
	}
	
	@Binding var nitrozenSheetTriggerDataFromParent: ChildViewLevel1.NitrozenSheetTriggerData
	@Binding var nitrozenSheetTriggerDataFromParentForLevel2: ChildViewLevel2.NitrozenSheetTriggerData

	var body: some View {
		VStack {
			Text("View Level - 1 (Child view) \n \(self.nitrozenSheetTriggerDataFromParent.selection.joined(separator: ", "))")
				.frame(maxWidth: .infinity, alignment: .leading)
				.onTapGesture {
					self.$nitrozenSheetTriggerDataFromParent.wrappedValue.isShowing = true
				}
			
			ChildViewLevel2(nitrozenSheetTriggerDataFromParent: $nitrozenSheetTriggerDataFromParentForLevel2)
		}
		.padding()
		.background(.gray.opacity(0.3))
		.cornerRadius(6)
	}
}


struct ChildViewLevel2: View {
	
	struct NitrozenSheetTriggerData {
		var isShowing: Bool
		var options: [String] = ["L", "XL", "M", "S", "XXL"]
		var selection: Set<String> = ["M", "S"]
	}
	
	@Binding var nitrozenSheetTriggerDataFromParent: ChildViewLevel2.NitrozenSheetTriggerData
	
	var body: some View {
		VStack {
			Text("View Level - 2 (Child view) \n \(self.nitrozenSheetTriggerDataFromParent.selection.joined(separator: ", "))")
				.frame(maxWidth: .infinity, alignment: .leading)
				.onTapGesture {
					self.$nitrozenSheetTriggerDataFromParent.wrappedValue.isShowing = true
				}
			
		}
		.padding()
		.background(.gray.opacity(0.3))
		.cornerRadius(6)
	}
}
