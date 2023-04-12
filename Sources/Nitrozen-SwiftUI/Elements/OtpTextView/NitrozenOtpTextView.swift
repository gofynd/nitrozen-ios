//
//  OtpTextView.swift
//  
//
//  Created by Keyur Patel on 11/04/23.
//

import SwiftUI
import Combine

@available(iOS 15, *)
public struct NitrozenOtpTextView: View {
	
	//MARK: Fields
	enum FocusField: Hashable {
		case field
	}
	@FocusState private var focusedField: FocusField?
	
	@Binding var otpCode: String
	var otpCodeLength: Int
	var placeHolder: String
	var isSecureField: Bool
	var isErrorCode: Bool?
	var isSuccessCode: Bool?
	var appearance: NitrozenAppearance.OTPTextView
	
	//MARK: Constructor
	public init(
		otpCode: Binding<String>,
		otpCodeLength: Int,
		placeHolder: String,
		isSecureField: Bool? = false,
		isErrorCode: Bool? = nil,
		isSuccessCode: Bool? = nil,
		appearance: NitrozenAppearance.OTPTextView? = nil) {
			self._otpCode = otpCode
			self.otpCodeLength = otpCodeLength
			self.placeHolder = placeHolder
			self.isSecureField = isSecureField.or(false)
			self.isErrorCode = isErrorCode
			self.isSuccessCode = isSuccessCode
			self.appearance = appearance.or(NitrozenAppearance.shared.otpTextView)
		}
	
	private var digitsIndices: [Int] { (0 ..< otpCodeLength).map { $0 } }
	
	//MARK: Body
	public var body: some View {
		bodyWithoutModifiers()
			.onTapGesture {
				self.focusedField = .field
			}
	}
	
	@ViewBuilder func bodyWithoutModifiers() -> some View {
		HStack {
			ZStack(alignment: .center) {
				TextField("", text: $otpCode)
					.frame(maxWidth: .infinity)
					.font(Font.system(size: 0))
					.accentColor(.clear)
					.foregroundColor(.clear)
					.multilineTextAlignment(.center)
					.keyboardType(.numberPad)
					.onReceive(Just(otpCode)) { _ in limitText(otpCodeLength) }
					.focused($focusedField, equals: .field)
					.padding()
				HStack {
					ForEach(digitsIndices, id: \.self) { index in
						ZStack {
							
							self.setPinAndPlaceholder(index)

							RoundedRectangle(cornerRadius: appearance.borderRadius)
								.stroke(getBorderColorByStatus(index),
										lineWidth: appearance.borderWidth
								)
								.frame(width: appearance.size.width,height: appearance.size.height)
						}

					}
				}
			}
		}
	}
	
	@ViewBuilder
	private func setPinAndPlaceholder(_ index: Int) -> some View {
		if self.otpCode.count <= index {
			let placeHolderText = self.isSecureField ? "\u{25CF}" : self.placeHolder
			Text(placeHolderText)
				.font(appearance.placeHolderStyle.font)
				.foregroundColor(appearance.placeHolderStyle.titleColor)
		} else {
			let pinText = self.isSecureField ? "\u{25CF}" : self.getPin(at: index)
			Text(pinText)
				.font(appearance.textStyle.font)
				.foregroundColor(appearance.textStyle.titleColor)
		}
	}
	
	private func getBorderColorByStatus(_ index: Int) -> SystemColor {
		if self.otpCode.count == otpCodeLength {
			if self.isErrorCode.or(false) {
				return appearance.errorColor
			} else if self.isSuccessCode.or(false) {
				return appearance.successColor
			}
		}
		if self.otpCode.isEmpty.isFalse, self.otpCode.count == index {
			return appearance.focusedBorderColor
		}
		return self.otpCode.count <= index ? appearance.borderColor : appearance.fillBorderColor
	}
	
	//MARK: func
	private func getPin(at index: Int) -> String {
		guard self.otpCode.count > index else {
			return placeHolder
		}

		return self.otpCode[index]
	}
	
	private func limitText(_ upper: Int) {
		if otpCode.count > upper {
			otpCode = String(otpCode.prefix(upper))
		}
	}
}

extension String {
	subscript(idx: Int) -> String {
		String(self[index(startIndex, offsetBy: idx)])
	}
}




struct OtpTextView_Previews: PreviewProvider {
	
	static var previews: some View {
		var otpcode:String = ""
		if #available(iOS 15, *) {
			NitrozenOtpTextView(
				otpCode: Binding(get: {
					return otpcode
				}, set: { value in
					otpcode = value
				}),
				otpCodeLength: 4,
				placeHolder: "0"
			)
			.frame(height: 80)
		} else {
			// Fallback on earlier versions
		}
	}
}
