//
//  RadioButton.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 27/03/23.
//

import SwiftUI
import Nitrozen_SwiftUI

struct RadioButton: View {
    
    @State var isTitleBox: Bool = false
    @State var isSubTitleBox: Bool = false
    
    var body: some View {
        List{
            Section {
                Text("CheckBox With Title")
                NitrozenRadio(
                    binding: $isTitleBox,
                    infos: [
                        .init(position: .title, text: "This is only title"),
                    ]
                )


            }
            
            Section {
                Text("CheckBox With Title and Subtitle")
                NitrozenRadio(
                    binding: $isSubTitleBox,
                    infos: [
                        .init(position: .title, text: "Hey, this is title"),
                        .init(position: .subTitle, text: "Hey, this is subtitle")
                    ]
                )

            }
        }
    }
}
