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
            
            
        }
        .nitrozenSheet(isPresented: $showingActionSheet, postion: .bottom) {
            NitrozenActionSheet(
                title: "Select Profile Picture",
                isShowing:$showingActionSheet,
                closeView: NitrozenActionSheet.CustomView.nitrozen,
                content: {
                    VStack(alignment: .leading, spacing: 12){
                        ForEach(options) { option in
                            Button(action: {
                                self.showingActionSheet.toggle()
                            }, label: {
                                HStack(alignment: .top) {
                                    Image(systemName: option.icon)
                                        .foregroundColor(.black)
                                    Text(option.name)
                                        .body(size: .s, weight: .regular)
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                                .frame(height: 30.0)
                                .padding(0)
                            })
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
        
        
    }
    
}
