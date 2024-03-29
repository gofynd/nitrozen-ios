//
//  OtpView.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Keyur Patel on 11/04/23.
//

import SwiftUI
import Nitrozen_SwiftUI

struct OtpView: View {
	@State var otpcode6:String = ""
	@State var otpcode7:String = ""
	@State var otpcode4:String = ""
	@State var otpcode5:String = ""
	@State var otpcode3:String = ""
	@State var otpcode10:String = ""
	
	var body: some View {
		
		List {
			Section("Nitrozen OTPField") {
				NitrozenOtpTextView(
					otpCode: $otpcode6,
					otpCodeLength: 6,
					placeHolder: "0",
					validationState: .error
				)
			}
			
			Section("Nitrozen OTPField") {
				NitrozenOtpTextView(
					otpCode: $otpcode7,
					otpCodeLength: 6,
					placeHolder: "0",
					validationState: .success,
					spacing: 4
				)
			}
			
			Section("SecureField OTPField with custom border color") {
				NitrozenOtpTextView(
					otpCode: $otpcode4,
					otpCodeLength: 4,
					placeHolder: "0",
					isSecureField: true,
					isAutoFirstResponder: true,
					appearance: NitrozenAppearance.shared.otpTextView.copy
						.borderColor(.green)
						.fillBorderColor(.blue)
						.size(CGSize.init(width: 60, height: 40))
						.borderRadius(0)
					
				)
			}
			
			Section("Custom Height OTPField") {
				NitrozenOtpTextView(
					otpCode: $otpcode5,
					otpCodeLength: 5,
					placeHolder: "0",
					appearance: NitrozenAppearance.shared.otpTextView.copy
						.size(CGSize.init(width: 60, height: 60))
				)
			}
			
			Section("Custom PlaceHolder") {
				NitrozenOtpTextView(
					otpCode: $otpcode3,
					otpCodeLength: 3,
					placeHolder: "\u{272A}",
					isAutoFirstResponder: false
				)
			}
			
			Section {
				NitrozenOtpTextView(
					otpCode: $otpcode10,
					otpCodeLength: 10,
					placeHolder: "0",
					appearance: NitrozenAppearance.shared.otpTextView.copy
						.size(CGSize.init(width: 20, height: 20))
				)
			}
			
		}
	}
}

struct OtpView_Previews: PreviewProvider {
	static var previews: some View {
		OtpView()
	}
}
