//
//  NitrozenPresentSheet.swift
//  
//
//  Created by Rushang Prajapati on 07/04/23.
//

import Foundation
import SwiftUI

public struct NitrozenPresentSheetModifier: ViewModifier {
	
	var isPresented:Binding<Bool>
	let postion:Alignment
	let childContent: AnyView
	var appearance: NitrozenAppearance.PresentSheet
	
	public init(
		isPresented: Binding<Bool>,
		postion: Alignment,
		content: AnyView,
		appearance: NitrozenAppearance.PresentSheet? = nil
	) {
		self.isPresented = isPresented
		self.postion = postion
		self.childContent = content
		self.appearance = appearance.or(NitrozenAppearance.shared.presentSheet)
	}
	
	@ViewBuilder
	public func body(content: Content) -> some View {
        ZStack {
            content
            ZStack(alignment: .bottom) {
                if (isPresented.wrappedValue) {
                    Color.black
                        .opacity(0.65)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            isPresented.wrappedValue.toggle()
                        }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.all)
            .animation(.easeInOut, value: isPresented.wrappedValue)
            
            ZStack {
                if isPresented.wrappedValue {
                    childContent
                        .transition(.move(edge: .bottom))
                        .background(
                            Color.white
                        )
                        .clipShape(RoundedCorner(radius: 24, corners: [.topLeft, .topRight]))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.all)
            .animation(.easeInOut, value: isPresented.wrappedValue)
            .zIndex(1)
        }
    }
	var outOfFocusArea: some View {
		Group {
			Rectangle()
				.background(Color.black)
				.opacity(Double(self.appearance.focusOpacity))
				.onTapGesture {
					self.isPresented.wrappedValue.toggle()
				}
				.edgesIgnoringSafeArea(.all)
		}
	}
	
}

extension View {
	
	@ViewBuilder
	public
	func nitrozenSheet<Content:View>(isPresented: Binding<Bool>, postion: Alignment, @ViewBuilder content: @escaping () -> Content) -> some View where Content : View{
		modifier(NitrozenPresentSheetModifier(isPresented: isPresented, postion: postion, content: AnyView(content().body)))
	}
	
}
