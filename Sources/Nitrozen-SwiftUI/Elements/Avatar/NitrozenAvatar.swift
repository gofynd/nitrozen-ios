//
//  NitrozenAvatar.swift
//  
//
//  Created by Keyur Patel on 18/04/23.
//

import SwiftUI

public struct NitrozenAvatar: View {
    
    
    //TODO: Hitendra - combine this common usage and change scope to align with Alert and actionSheet in future once other MR merged
    public enum CustomImageView {
        case systemImage(name: String) //customized image from SFSymbol
        case assetImage(name: String) //customized image from .xcassets
        case custom(view: AnyView) // whole customized view
        case text(_ string: String) // for first 2 charector of text
    }
    
    var mainView: CustomImageView
    var appearance: NitrozenAppearance.Avatar
    
    private let initialsMaxCharacterCount: Int = 2
    
    public init(
        mainView: CustomImageView,
         appearance: NitrozenAppearance.Avatar? = nil
    ) {
        self.mainView = mainView
        self.appearance = appearance.or(NitrozenAppearance.shared.avatar)
    }
    
    public var body: some View {
       bodyWithoutModifiers()
    }
    
    @ViewBuilder
    func bodyWithoutModifiers() -> some View {
        ZStack {
            
            switch self.mainView {
            case .systemImage(let imageName):
                Image(systemName: imageName)
                    .resizable()
                    .position()
                    .frame(width: self.appearance.size.width / 2, height: self.appearance.size.height / 2)

            case .assetImage(let imageName):
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: self.appearance.size.width, height: self.appearance.size.height)

            case .custom(let customView):
                customView
                    .frame(width: self.appearance.size.width, height: self.appearance.size.height)
                
            case .text(let title):
                Text(self.initalsText(from: title))
                    .foregroundColor(appearance.textStyle.titleColor)
                    .font(appearance.textStyle.font)
            }
        }
        .frame(width: self.appearance.size.width, height: self.appearance.size.height)
        .background(self.appearance.backgroundColor)
        .apply(shape: self.appearance.viewShape, color: self.appearance.borderColor, lineWidth: self.appearance.borderWidth)
        
    }
    
    func initalsText(from fullText: String) -> String {
        let words = fullText.components(separatedBy: .whitespacesAndNewlines)
        
        if words.count == 1, let firstWord = words.first {
            return String(firstWord.prefix(self.initialsMaxCharacterCount)).uppercased()
        }
        
        let initials = words.reduce(into: "") { (result, word) in
            if let firstCharacter = word.first {
                result.append(firstCharacter)
                if result.count == self.initialsMaxCharacterCount {
                    return
                }
                
            }
        }

        return initials.uppercased()
    }

}



