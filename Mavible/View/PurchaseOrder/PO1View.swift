//
//  PO1View.swift
//  Mavible
//
//  Created by Nathanael DJ on 16/11/21.
//

import SwiftUI

struct PO1View: View {
    
    @Binding var text: String
    @Binding var qty: String
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
                    Image("InboundIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70, alignment: .leading)
                    VStack (alignment: .leading, spacing: 5) {
                        Text("tepung")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        TextField("100", text: $qty)
                            .font(.system(size: 14))
                            .frame(height: 34)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 10)
                            .cornerRadius(20)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                    }
                }
            }.padding()
            NavigationLink(destination: POConfirmationView()){
                Text("Lanjut")
                    .frame(maxWidth: 219, maxHeight: 20)
                    .font(.system(size: 20))
                    .padding()
                    .foregroundColor(.black)
                    .background(CustomColor.raindropColor)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
            }
           
        }.listStyle(PlainListStyle())
        
    }
}


struct PO1View_Previews: PreviewProvider {
    static var previews: some View {
        PO1View(text: .constant(""), qty: .constant(""))
    }
}
