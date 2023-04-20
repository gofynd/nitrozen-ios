//
//  File.swift
//  
//
//  Created by Keyur Patel on 18/04/23.
//

import Foundation

public extension NitrozenAppearance {
    
    class Avatar {
        
        var borderWidth: CGFloat
        var borderColor: SystemColor
        var backgroundColor: SystemColor
        var textStyle: TextLabel
        var viewShape: ViewShape
        var size: CGSize
        
        public init(borderWidth: CGFloat,
                    borderColor: SystemColor,
                    backgroundColor: SystemColor,
                    textStyle: TextLabel,
                    viewShape: ViewShape,
                    size: CGSize) {
            
            self.borderWidth = borderWidth
            self.borderColor = borderColor
            self.backgroundColor = backgroundColor
            self.textStyle = textStyle
            self.viewShape = viewShape
            self.size = size
        }
        
        
    }
    
}

public extension NitrozenAppearance.Avatar {
    
    @discardableResult
    func borderWidth(_ borderWidth: CGFloat) -> Self { self.borderWidth = borderWidth; return self }
    
    @discardableResult
    func borderColor(_ borderColor: SystemColor) -> Self { self.borderColor = borderColor; return self }
    
    @discardableResult
    func backgroundColor(_ backgroundColor: SystemColor) -> Self { self.backgroundColor = backgroundColor; return self }
    
    @discardableResult
    func textStyle(_ textStyle: NitrozenAppearance.TextLabel) -> Self { self.textStyle = textStyle; return self }
    
    @discardableResult
    func viewShape(_ viewShape: ViewShape) -> Self { self.viewShape = viewShape; return self }
    
    @discardableResult
    func size(_ size: CGSize) -> Self { self.size = size; return self }
    
}

//MARK: Copy Support
public extension NitrozenAppearance.Avatar {
    var copy: NitrozenAppearance.Avatar {
        .init(
            borderWidth: self.borderWidth,
            borderColor: self.borderColor,
            backgroundColor: self.backgroundColor,
            textStyle: self.textStyle,
            viewShape: self.viewShape,
            size: self.size
        )
    }
}
