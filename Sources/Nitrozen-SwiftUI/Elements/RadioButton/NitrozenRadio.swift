//
//  File.swift
//  
//
//  Created by Rushang Prajapati on 05/04/23.
//

import Foundation
import SwiftUI

public struct NitrozenRadio: View {
    var binding: Binding<Bool>
    var infos: [Info] = []
    
    public struct Info {
        public enum Position: Hashable {  case title, subTitle }
        var position: Position
        var text: String
        var appearance: NitrozenAppearance.TextLabel?
        
        public init(
            position: Position,
            text: String,
            appearance: NitrozenAppearance.TextLabel? = nil
        ){
            self.position = position
            self.text = text
            self.appearance = appearance
        }
        
    }
    
    public init(
        binding: Binding<Bool>,
        infos: [Info]
        
    ){
        self.binding = binding
        self.infos = infos
    }
    
    public var body: some View {
        
        VStack(alignment: .leading,spacing:8) {
            HStack(alignment: .center) {
                radioButton()
                titleLabel()
            }
            subTitleLabel()
            
        }
        .onTapGesture {
            self.binding.wrappedValue.toggle()
        }
        
    }
    
    @ViewBuilder
    func radioButton() ->some View{
        ZStack {
            Circle()
                .fill(.white)

            Circle()
                .strokeBorder(
                    binding.wrappedValue ? NitrozenAppearance.shared.radioButton.selectedBorderColor : NitrozenAppearance.shared.radioButton.deSelectedBorderColor ,
                    lineWidth: binding.wrappedValue ? NitrozenAppearance.shared.radioButton.selectedBorderWidth : NitrozenAppearance.shared.radioButton.deSelectedBorderWidth
                )
        }
        .frame(width: 20, height: 20)
        
    }
    
    @ViewBuilder
    func titleLabel() -> some View {
        self.infos.filter { $0.position == .title }
            .first.convertToView { info in
                Text(info.text)
                    .foregroundColor(
                        binding.wrappedValue ? info.appearance.or(NitrozenAppearance.shared.radioButton.selectedTitle).titleColor : info.appearance.or(NitrozenAppearance.shared.radioButton.selectedTitle).titleColor
                    )
                    .font(info.appearance.or(NitrozenAppearance.shared.radioButton.selectedTitle).font)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
    }
    
    @ViewBuilder
    func subTitleLabel() -> some View {
        self.infos.filter { $0.position == .subTitle }
            .first.convertToView { info in
                Text(info.text)
                    .foregroundColor(
                        binding.wrappedValue ? info.appearance.or(NitrozenAppearance.shared.radioButton.deSelectedTitle).titleColor : info.appearance.or(NitrozenAppearance.shared.radioButton.deSelectedTitle).titleColor
                    )
                    .font(info.appearance.or(NitrozenAppearance.shared.radioButton.deSelectedTitle).font)
                    .multilineTextAlignment(.leading)
            }
    }
    
    
}

struct NitrozenRadio_Preview: PreviewProvider {
    static var previews: some View {
        NitrozenRadio(
            binding: .constant(false),
            infos: [
                .init(position: .title, text: "This is title"),
                .init(position: .subTitle, text: "This is subTitle")
            ]
        )
    }
}
