//
//  EmptyView.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Keyur Patel on 20/04/23.
//

import SwiftUI
import Nitrozen_SwiftUI

struct EmptyView: View {
    var body: some View {
        NitrozenEmptyView(icon: Image(systemName: "person")) {
            
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
