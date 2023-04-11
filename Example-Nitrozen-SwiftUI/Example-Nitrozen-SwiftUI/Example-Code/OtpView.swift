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
	@State var otpcode4:String = ""
	@State var otpcode5:String = ""
	@State var otpcode3:String = ""
	@State var otpcode10:String = ""
	
    var body: some View {
		
		VStack(spacing: 40) {
			
			VStack {
				Text("Nitrozen OTPField")
				OtpTextView(
					otpCode: $otpcode6,
					otpCodeLength: 6,
					placeHolder: "0"
				)
			}
			
			VStack {
				Text("SecureField OTPField with custom border color")
				OtpTextView(
					otpCode: $otpcode4,
					otpCodeLength: 4,
					placeHolder: "0",
					isSecureField: true,
					appearance: NitrozenAppearance.shared.otpTextView.copy
						.borderColor(.green)
						.fillBorderColor(.blue)
					
					
				)
			}
			
			VStack {
				Text("Custom Height OTPField")
				OtpTextView(
					otpCode: $otpcode5,
					otpCodeLength: 5,
					placeHolder: "0",
					appearance: NitrozenAppearance.shared.otpTextView.copy
						.height(60)
					
				)
			}
			
			VStack {
				Text("Custom PlaceHolder")
				OtpTextView(
					otpCode: $otpcode3,
					otpCodeLength: 3,
					placeHolder: "\u{272A}"
				)
			}
			
			VStack {
				OtpTextView(
					otpCode: $otpcode10,
					otpCodeLength: 10,
					placeHolder: "0",
					appearance: NitrozenAppearance.shared.otpTextView.copy
						.height(20)
				)
			}
		}
		Spacer()
    }
}

struct OtpView_Previews: PreviewProvider {
    static var previews: some View {
        OtpView()
    }
}
