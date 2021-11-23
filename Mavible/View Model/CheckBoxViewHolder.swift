//
//  CheckBoxViewHolder.swift
//  Mavible
//
//  Created by vincent meidianto on 18/11/21.
//

import Foundation
import SwiftUI

struct CheckBoxView: View {
    @State var checked: Bool
    @Binding var checkedAll: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            //.frame(width: 100, height: 100)
            .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
            .onTapGesture {
                self.checked.toggle()
            }//.frame(width: 100, height: 100)
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
        @State var checked = false
        @State var checkedAll = false

        var body: some View {
            CheckBoxView(checked: checked, checkedAll: $checkedAll)
        }
    }

    static var previews: some View {
        CheckBoxViewHolder()
    }
}
