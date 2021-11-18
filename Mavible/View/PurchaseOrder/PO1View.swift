//
//  PO1View.swift
//  Mavible
//
//  Created by Nathanael DJ on 16/11/21.
//

import SwiftUI

struct PO1View: View {
    
    @Binding var text: String
    @State var isEditing: Bool = false
    var body: some View {
        VStack {
            // title
            Text("PO 1")
                .font(.title)
                .bold()
            // search bar
            TextField("Search...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
            Spacer()
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                HStack {
                    Image("gambar item")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70, alignment: .leading)
                    VStack (alignment: .leading, spacing: 5) {
                        Text("nama item")
                            .font(.title3)
                            .fontWeight(.bold)
                       
                        Text("lorem ipsum dolor sir amet")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                    }
                    VStack {
                        Text("1")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    /*    Stepper(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(4)/*@END_MENU_TOKEN@*/, in: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Range@*/1...10/*@END_MENU_TOKEN@*/) {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Stepper")/*@END_MENU_TOKEN@*/
                        } */

                    }
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

struct PO1View_Previews: PreviewProvider {
    static var previews: some View {
        PO1View(text: .constant(""))
    }
}
