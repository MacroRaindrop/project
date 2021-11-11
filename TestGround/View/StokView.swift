//
//  StokView.swift
//  Macro-Proj1
//
//  Created by Fandika Ikhsan on 01/11/21.
//

import SwiftUI


struct StokView: View {
    @Binding var text: String
    @State var isEditing: Bool = false
    
    
    
    
    var body: some View {
      
        VStack {
<<<<<<< Updated upstream:TestGround/View/StokView.swift
            
            
            // title
            VStack {
                Text("Stok")
                    .font(.title)
                    .bold()

            }
            
=======
            Text("Stok")
                .font(.title)
                .bold()
>>>>>>> Stashed changes:Mavible/View/StokView.swift
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
<<<<<<< Updated upstream:TestGround/View/StokView.swift
            
            // card
//            CardList(card: Card.example)
=======
>>>>>>> Stashed changes:Mavible/View/StokView.swift
            ListVIew()
        }
    }
}
struct ListVIew: View {
<<<<<<< Updated upstream:TestGround/View/StokView.swift
    
//    let card: Card
//
=======
>>>>>>> Stashed changes:Mavible/View/StokView.swift
    var body: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            HStack {
                Image("beras-gambar")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70, alignment: .leading)
                VStack (alignment: .leading, spacing: 5) {
                    Text("Fabduja")
                        .font(.title3)
                        .fontWeight(.bold)
                    Divider()
                    Text("lorem ipsum dolor sir amet")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                }
                VStack {
                    Text("1")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Karung")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
<<<<<<< Updated upstream:TestGround/View/StokView.swift
                .padding()
                .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.yellow, lineWidth: 1)
                    )
                
                
                Spacer()
                
=======
>>>>>>> Stashed changes:Mavible/View/StokView.swift
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.yellow, lineWidth: 1)
            )
            Spacer()
        }
    }
}

struct StokView_Previews: PreviewProvider {
    static var previews: some View {
        StokView(text: .constant(""))
    }
}
