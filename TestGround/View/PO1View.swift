//
//  PO1View.swift
//  TestGround
//
//  Created by Nathanael DJ on 11/11/21.
//

import SwiftUI

struct PO1View: View {
    @Binding var searchbar: String
    @State var itemQty: String = ""
    @State var isEditing: Bool = false

    var body: some View {
        VStack {
            // title
            VStack {
                Text("PO1")
                    .padding()
                    .font(.system(size: 30, weight: .bold))
            }
            // search bar
            TextField("Search...", text: $searchbar)
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
                    self.searchbar = ""
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
            HStack {
                Image("(gambar item1)")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70, alignment: .leading)
                
                VStack (alignment: .leading, spacing: 10) {
                    Text("item1")
                        .font(.title3)
                        .fontWeight(.bold)
                    TextField("(jumlah item)", text: self.$itemQty)
                    
                }
                
                VStack {
                    HStack{
                        Stepper(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(4)/*@END_MENU_TOKEN@*/, in: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Range@*/1...10/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Stepper")/*@END_MENU_TOKEN@*/
                    }

                }
                
            }
                .padding(.bottom, 20)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 1)
            )
            
            
            Spacer()
        }
            
    }
}

struct PO1View_Previews: PreviewProvider {
    static var previews: some View {
        PO1View(searchbar: .constant(""))
    }
}

}
