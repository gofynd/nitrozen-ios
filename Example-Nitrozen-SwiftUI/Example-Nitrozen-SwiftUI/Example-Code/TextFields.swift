//
//  TextFields.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 27/03/23.
//

import SwiftUI
import Nitrozen_SwiftUI

struct TextFields: View {

	@State var textField1: String = ""
	@State var textField2: String = ""
	@State var textField3: String = ""
	@State var textField4: String = "lorem ipsum text by user"
	@State var textField5: String = "lorem ipsum text by user"
	@State var textField6: String = "lorem ipsum text by user"
	
	@State var tooltip1 = false
	@State var tooltip2 = false

	
	var body: some View {
		List{
			
			Section {
				Text("Textfields with Top info with tooltip default image")

				NitrozenTextField(
					binding: $textField1,
					placeHolder: "Textfield 1",
					infos: [
						.init(position: .top, text: "This is textfield 1", toolTipIcon: .nitrozen, onTapToolTip: {
							tooltip1 = true
						})
				
					],
					leftView: nil, rightView: nil)
				
			}
			
			Section {
				Text("Textfields with Success info tooltip custom image")
				NitrozenTextField(
					binding: $textField2,
					placeHolder: "Textfield 2",
					infos: [
						.init(position: .top, text: "This is textfield 2", toolTipIcon: .systemImage(name: "info.circle.fill"), onTapToolTip: {
							tooltip1 = true
						}),
						.init(position: .success, text: "Success of textfield 2")
					],
					leftView: nil, rightView: nil)
				
			}
			
			Section {
				Text("Textfields with Error info")

				NitrozenTextField(
					binding: $textField3,
					placeHolder: "Textfield 3",
					infos: [
						.init(position: .top, text: "This is textfield 3"),
						.init(position: .error, text: "Error of textfield 3")
					])
			}
			
			Section {
				Text("Disable Textfields with Top info")

				NitrozenTextField(
					binding: $textField4,
					placeHolder: "Textfield 4",
					infos: [
						.init(position: .top, text: "This is textfield 4")
					])
				.disabled(true)
			}
			
			Section {
				Text("Left and right view Textfields with Top info")

				NitrozenTextField(
					binding: $textField5,
					placeHolder: "Textfield 5",
					infos: [
						.init(position: .top, text: "This is textfield 5")
					],
					leftView: AnyView(Image(systemName: "person.fill")),
					rightView: AnyView(Image(systemName: "steeringwheel.and.key"))
				)
			}
			
			Section {
				Text("Password Textfields with Left and right view and top info")

				NitrozenTextField(
					binding: $textField6,
					placeHolder: "Password",
					infos: [
						.init(position: .top, text: "Enter your password")
					],
					isSecure: true,
					leftView: AnyView(Image(systemName: "key.fill")),
					rightView: AnyView(Image(systemName: "eye.fill")) //Use button here instead of Image - to get tap interaction
				)
			}
		}
		.nitrozenSheet(isPresented: $tooltip1, postion: .center, content: {
			NitrozenActionSheet(
				title: "Inforamation",
				isShowing: $tooltip1,
				closeView: NitrozenActionSheet.CustomView.nitrozen,
				content: {
					Text("Its not good to ask gender but it would be great if you provide us!! Its not good to ask gender but it would be great if you provide us!! Its not good to ask gender but it would be great if you provide us!! Its not good to ask gender but it would be great if you provide us!! ")
						.padding(.top, 12)
				})
			
		})

	}
}
