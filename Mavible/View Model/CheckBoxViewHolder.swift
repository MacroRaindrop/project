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
    //@Binding var checkedAll: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            
            .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
            .onTapGesture {
                self.checked.toggle()
                
            }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
        @State var checked = false
        @State var checkedAll = false

        var body: some View {
            CheckBoxView(checked: checked)
        }
    }

    static var previews: some View {
        CheckBoxViewHolder()
    }
}
