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
    var isDisable: Bool
    var appearance: NitrozenAppearance.Avatar
    
    private var maxCharacterCount: Int
    
    public init(
        mainView: CustomImageView,
         isDisable: Bool = false,
         appearance: NitrozenAppearance.Avatar? = nil
    ) {
        self.mainView = mainView
        self.isDisable = isDisable
        self.appearance = appearance.or(NitrozenAppearance.shared.avatar)
        self.maxCharacterCount = 2
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
                    

            case .assetImage(let imageName):
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: self.appearance.size.width, height: self.appearance.size.height)

            case .custom(let customView):
                customView
                    .frame(width: self.appearance.size.width, height: self.appearance.size.height)
                
            case .text(let title):
                Text(self.getMaxTwoCharectorFromString(text: title))
                    .foregroundColor(appearance.textStyle.titleColor)
                    .font(appearance.textStyle.font)
            }
        }
        .frame(width: self.appearance.size.width, height: self.appearance.size.height)
        .background(self.appearance.backgroundColor)
        .apply(shape: self.appearance.viewShape, color: self.appearance.borderColor, lineWidth: self.appearance.borderWidth)
        .opacity(self.isDisable ? self.appearance.disableOpacity : 1)
        
    }
    
    func getMaxTwoCharectorFromString(text: String) -> String {
        let words = text.components(separatedBy: .whitespacesAndNewlines)
        
        if words.count == 1, let firstWord = words.first {
            return String(firstWord.prefix(self.maxCharacterCount)).uppercased()
        }
        
        let initials = words.reduce(into: "") { (result, word) in
            if let firstCharacter = word.first {
                result.append(firstCharacter)
                if result.count == self.maxCharacterCount {
                    return
                }
                
            }
        }

        return initials.uppercased()
    }

}



