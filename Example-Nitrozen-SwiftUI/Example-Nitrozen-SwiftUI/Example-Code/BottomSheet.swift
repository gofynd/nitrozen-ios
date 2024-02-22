//
//  BottomSheet.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Shadhiq on 30/01/24.
//

import SwiftUI
import Nitrozen_SwiftUI

struct BottomSheet: View {

        
        var options: [ActionOptions] = ActionOptions.options
        @State var showingRadioButton = false
        @State var showingActionSheet = false
        @State var showingCheckBox = false
        
        var options1: [String] = ["Male", "Female", "Other"]
        @State var selection1: Set<String> = ["Male"]
        
        
        var options2: [String] = ["L", "XL", "M" , "S" , "XXL"]
        @State var selection2: Set<String> = []
        
        
        
        @State var nitrozenSheetTriggerDataForChild1: BottomSheetChildViewLevel1.NitrozenSheetTriggerData = .init(isShowing: false)
        @State var nitrozenSheetTriggerDataForChild2: BottomSheetChildViewLevel2.NitrozenSheetTriggerData = .init(isShowing: false)
        
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
                        
                        BottomSheetChildViewLevel1(
                            nitrozenSheetTriggerDataFromParent: $nitrozenSheetTriggerDataForChild1,
                            nitrozenSheetTriggerDataFromParentForLevel2: $nitrozenSheetTriggerDataForChild2
                        )
                    }
                }
                
            }
            .overlay(content: {
                NitrozenBottomSheetView(
                    title: "Select Profile Picture",
                    isPresented: $showingActionSheet,
                    closeView: NitrozenBottomSheetView.CustomView.nitrozen) {
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

                    }
            })
            .overlay(content: {
                NitrozenBottomSheetView(
                    title: "Select Gender",
                    subTitle: "Its not good to ask gender but it would be great if you provide us!! ",
                    isPresented: $showingRadioButton,
                    closeView: NitrozenBottomSheetView.CustomView.nitrozen,
                    content: {
                        VStack(alignment: .leading, spacing: 0) {
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
                        }
                    })
            })
            
            .overlay(content: {
                NitrozenBottomSheetView(
                    title: "Select Tshirt Size",
                    isPresented:$showingCheckBox,
                    closeView: NitrozenBottomSheetView.CustomView.nitrozen,
                    content: {
                        VStack(alignment: .leading, spacing: 0) {
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

                        }
                    })
            })
            
            .overlay(content: {
                NitrozenBottomSheetView(
                    title: "Select Gender - from child view level 1",
                    subTitle: "Its not good to ask gender but it would be great if you provide us!",
                    isPresented: $nitrozenSheetTriggerDataForChild1.isShowing,
                    closeView: NitrozenBottomSheetView.CustomView.nitrozen,
                    content: {
                        VStack(alignment: .leading, spacing: 0) {
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
                        }
                    })
            })
            
            .overlay(content: {
                NitrozenBottomSheetView(
                    title: "Select Tshirt Size - from child view level 2",
                    isPresented:$nitrozenSheetTriggerDataForChild2.isShowing,
                    closeView: NitrozenBottomSheetView.CustomView.nitrozen,
                    content: {
                        VStack(alignment: .leading, spacing: 0) {
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
                        }
                    })
            })
        }
}

#Preview {
    BottomSheet()
}

struct BottomSheetChildViewLevel1: View {
    
    struct NitrozenSheetTriggerData {
        var isShowing: Bool
        var options: [String] = ["Male", "Female", "Other"]
        var selection: Set<String> = ["Male"]
    }
    
    @Binding var nitrozenSheetTriggerDataFromParent: BottomSheetChildViewLevel1.NitrozenSheetTriggerData
    @Binding var nitrozenSheetTriggerDataFromParentForLevel2: BottomSheetChildViewLevel2.NitrozenSheetTriggerData

    var body: some View {
        VStack {
            Text("View Level - 1 (Child view) \n \(self.nitrozenSheetTriggerDataFromParent.selection.joined(separator: ", "))")
                .frame(maxWidth: .infinity, alignment: .leading)
                .onTapGesture {
                    self.$nitrozenSheetTriggerDataFromParent.wrappedValue.isShowing = true
                }
            
            BottomSheetChildViewLevel2(nitrozenSheetTriggerDataFromParent: $nitrozenSheetTriggerDataFromParentForLevel2)
        }
        .padding()
        .background(.gray.opacity(0.3))
        .cornerRadius(6)
    }
}


struct BottomSheetChildViewLevel2: View {
    
    struct NitrozenSheetTriggerData {
        var isShowing: Bool
        var options: [String] = ["L", "XL", "M", "S", "XXL"]
        var selection: Set<String> = ["M", "S"]
    }
    
    @Binding var nitrozenSheetTriggerDataFromParent: BottomSheetChildViewLevel2.NitrozenSheetTriggerData
    
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
