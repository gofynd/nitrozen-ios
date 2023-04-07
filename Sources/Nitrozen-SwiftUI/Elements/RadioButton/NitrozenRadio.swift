//
//  NitrozenRadio.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Rushang Prajapati on 05/04/23.
//

import Foundation
import SwiftUI

//MARK: NitrozenCheckbox
public struct NitrozenRadio<Element>: View where Element: NitrozenElementRadioStringSelectableStyle & Hashable {
	
	//TODO: Rushang -- Move this layout type outside to use at multiple places
    public enum Layout {
        case horizontal, verticle
    }
    
    var options: Array<Element>
    @Binding var selection: Set<Element>
    var layout: Layout
    var appearance: NitrozenAppearance.RadioButton
    
    public init(options: Array<Element>, selection: Binding<Set<Element>>,
                layout: Layout, appearance: NitrozenAppearance.RadioButton? = nil) {
        self.options = options
        self._selection = selection
        self.layout = layout
        self.appearance = appearance.or(NitrozenAppearance.shared.radioButton)
    }
    
    public var body: some View {
        switch self.layout {
        case .horizontal:
            HStack {
                listView()
            }
        case .verticle:
            VStack {
                listView()
            }
        }
    }
    
    @ViewBuilder
    func listView() -> some View {
        ForEach(self.options, id: \.hashValue) { item in
            
            NitrozenRadioButtonItem(
                isSelected: selection.contains(item),
                title: item.selectionTitleText,
                subTitle: item.selectionSubTitleText.or(""),
                appearance:self.appearance
            )
            .onTapGesture {
                withAnimation {
                    if self.selection.contains(item).isFalse {
                        self.selection.removeAll()
                        self.selection.insert(item)
                    }
                }
            }
        }
    }
}


//MARK: NitrozenCheckboxItem
public struct NitrozenRadioButtonItem: View {
    
    var isSelected: Bool
    var title: String?
    var subTitle: String?
    var appearance: NitrozenAppearance.RadioButton
    
    public init(
        isSelected: Bool,
        title: String? = nil,
        subTitle: String? = nil,
        appearance: NitrozenAppearance.RadioButton? = nil
    ) {
        self.isSelected = isSelected
        self.title = title
        self.subTitle = subTitle
        self.appearance = appearance.or(NitrozenAppearance.shared.radioButton)
    }
    
    public var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center) {
                radioButton()
                titleLabel()
            }
            subTitleLabel()
        }
        
    }
    
    @ViewBuilder
    func radioButton() ->some View{
        ZStack {
            Circle()
                .fill(.white)
            
            Circle()
                .strokeBorder(
                    isSelected ? self.appearance.selectedBorderColor : self.appearance.deSelectedBorderColor ,
                    lineWidth: isSelected ? self.appearance.selectedBorderWidth : self.appearance.deSelectedBorderWidth
                )
        }
        .frame(width: 20, height: 20)
        
    }
    
    @ViewBuilder
    func titleLabel() -> some View {
        self.title.convertToView(block: { text in
            Text(text)
                .foregroundColor(
                    isSelected ? self.appearance.selectedTitle.titleColor : self.appearance.deSelectedTitle.titleColor
                )
                .font(isSelected ? self.appearance.selectedTitle.font : self.appearance.deSelectedTitle.font)
                .multilineTextAlignment(.leading)
            Spacer()
        })
    }
    
    @ViewBuilder
    func subTitleLabel() -> some View {
        self.subTitle.convertToView(block: { text in
            Text(text)
                .foregroundColor(
                    isSelected ? self.appearance.selectedSubTitle.titleColor : self.appearance.deSelectedSubTitle.titleColor
                )
                .font(isSelected ? self.appearance.selectedSubTitle.font : self.appearance.deSelectedSubTitle.font)
                .multilineTextAlignment(.leading)
        })
        
    }
    
}
