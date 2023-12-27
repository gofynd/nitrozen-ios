//
//  NitrozenTextField.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 28/03/23.
//

import SwiftUI
import SwiftUITooltip

@available(iOS 15.0, *)
public struct NitrozenTextField: View {
    
    public struct Info {
        
        public enum Position: Hashable {  case top, error, success }
        
        var position: Position
        var text: String
        var canShow: Bool
        var toolTipIconView: AnyView?
        var onTapToolTip: ElementTap?
        var appearance: NitrozenAppearance.TextLabel?
        
        public init(position: Position, text: String, canShow: Bool = true, appearance: NitrozenAppearance.TextLabel? = nil) {
            self.position = position
            self.text = text
            self.canShow = canShow
            self.appearance = appearance
            
        }
        
        public init(
            position: Position,
            text: String,
            canShow: Bool = true,
            appearance: NitrozenAppearance.TextLabel? = nil,
            toolTipIconView:AnyView,
            onTapToolTip: @escaping ElementTap) {
                
                self.position = position
                self.text = text
                self.toolTipIconView = toolTipIconView
                self.canShow = canShow
                self.appearance = appearance
                self.onTapToolTip = onTapToolTip
            }
        
    }
    
    var isSecure: Bool = false
    
    var binding: Binding<String>
    
    var placeHolder: String
    var infos: [Info] = []
    
    var apperance: NitrozenAppearance.TextField
    
    var leftView: AnyView? = nil
    var rightView: AnyView? = nil
    @FocusState var focused: Bool

    
    public init(
        binding: Binding<String>, placeHolder: String,
        infos: [Info],
        isSecure: Bool = false,
        apperance: NitrozenAppearance.TextField? = nil,
        leftView: AnyView? = nil, rightView: AnyView? = nil
    ) {
        self.isSecure = isSecure
        self.binding = binding
        self.placeHolder = placeHolder
        self.infos = infos
        self.leftView = leftView
        self.rightView = rightView
        self.apperance = apperance.or(NitrozenAppearance.shared.textField)
        
        //			.init()
        //				.textFieldFont(NitrozenAppearance.shared.textField.font)
        //				.textFieldColor(NitrozenAppearance.shared.textField.titleColor)
        //				.allowsFloatingPlaceholder(false)
        //				.leftView(AnyView(self.leftView.convertToView{ $0 }))
        //				.rightView(AnyView(self.rightView.convertToView{ $0 }))
        
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            infoView()
            textField()
            errorView()
            successView()
        }
    }
    
    
    @ViewBuilder
    func textField() -> some View {
        HStack {
            leftView.convertToView { $0 }
            Group {
                if self.isSecure {
                    SecureField(placeHolder, text: binding)
                        .focused($focused)
                } else {
                    TextField(placeHolder, text: binding)
                        .focused($focused)
                }
            }
            rightView.convertToView { $0 }
        }
        .apply(padding: self.apperance.borderPadding)
        .foregroundColor(self.apperance.textFieldInternalTextLabel.titleColor)
        .font(self.apperance.textFieldInternalTextLabel.font)
        .background(self.apperance.backgroundColor)
        .nitrozen.roundedCornerWithBorder(color: getBorderColor(), radius: self.apperance.borderRadius, lineWidth: self.apperance.borderWidth)
    }
    
    func getBorderColor() -> Color {
        if self.infos.contains(where: {$0.position == .success }) {
            return Color(self.apperance.sucessInfo.titleColor.uiColor().lighter(percentage: 30))
        } else if self.infos.contains(where: {$0.position == .error }) {
            return Color(self.apperance.errorInfo.titleColor.uiColor().lighter(percentage: 30))
        } else if self.focused {
            return self.apperance.focusBorderColor
        } else {
            return self.apperance.borderColor
        }
    }
    
    @ViewBuilder
    func infoView() -> some View {
        self.infos.filter { $0.position == .top }
            .first.convertToView { info in
                if info.canShow {
                    HStack {
                        Spacer().frame(width: 6)
                        
                        HStack{
                            Text(info.text)
                                .foregroundColor(info.appearance.or(NitrozenAppearance.shared.textField.topInfo).titleColor)
                                .font(info.appearance.or(NitrozenAppearance.shared.textField.topInfo).font)
                            
                            Button {
                                info.onTapToolTip.or {
                                    
                                }()
                                
                            } label: {
                                info.toolTipIconView
                            }
                            
                        }
                        
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .apply(padding: self.apperance.topInfoPadding)
                }
            }
    }
    
    @ViewBuilder
    func errorView() -> some View {
        self.infos.filter { $0.position == .error }
            .first.convertToView { info in
                if info.canShow {
                    HStack {
                        
                        Spacer().frame(width: 2)

                        switch NitrozenAppearance.shared.textField.errorInfoImage{
                            
                        case .assetImage(let imageName):
                            Image(imageName)
                            
                        case .systemImage(let imageName):
                            Image(systemName: imageName)
                                .foregroundColor(info.appearance.or(NitrozenAppearance.shared.textField.errorInfo).titleColor)
                            
                        case .custom(let customView):
                            customView
                            
                        }

                        Spacer().frame(width: 6)
                        
                        Text(info.text)
                            .foregroundColor(info.appearance.or(NitrozenAppearance.shared.textField.errorInfo).titleColor)
                            .font(info.appearance.or(NitrozenAppearance.shared.textField.errorInfo).font)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .apply(padding: self.apperance.errorInfoPadding)
                }
            }
    }
    
    @ViewBuilder
    func successView() -> some View {
        self.infos.filter { $0.position == .success }
            .first.convertToView { info in
                if info.canShow {
                    HStack {
                        
                        Spacer().frame(width: 2)

                        switch NitrozenAppearance.shared.textField.sucessInfoImage{
                            
                        case .assetImage(let imageName):
                            Image(imageName)
                            
                        case .systemImage(let imageName):
                            Image(systemName: imageName)
                                .foregroundColor(info.appearance.or(NitrozenAppearance.shared.textField.errorInfo).titleColor)

                            
                        case .custom(let customView):
                            customView
                            
                        }
                        
                        Spacer().frame(width: 6)
                        
                        Text(info.text)
                            .foregroundColor(info.appearance.or(NitrozenAppearance.shared.textField.sucessInfo).titleColor)
                            .font(info.appearance.or(NitrozenAppearance.shared.textField.sucessInfo).font)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .apply(padding: self.apperance.successInfoPadding)
                }
            }
    }
}
