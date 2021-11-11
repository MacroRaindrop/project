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
            // title
            VStack {
                Text("Stok")
                    .font(.title)
                    .bold()
            }
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
                .animation(.default)
            }
            
            // card
            //            CardList(card: Card.example)
            ListVIew()
            
            
        }
        
        
        
    }
}

//struct Card {
//    let prompt: String
//    let answer: String
//
//    static var example: Card {
//        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
//    }
//}
//
//struct CardView: View {
//    let card: Card
//
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 25, style: .continuous)
//                .fill(Color.white)
//
//            VStack {
//                Text(card.prompt)
//                    .font(.largeTitle)
//                    .foregroundColor(.black)
//
//                Text(card.answer)
//                    .font(.title)
//                    .foregroundColor(.gray)
//            }
//            .padding(20)
//            .multilineTextAlignment(.center)
//        }
//        .frame(width: 450, height: 250)
//    }
//}

//struct Card {
//    @State var users: [String] = []
//
//    // DATA LIES HERE
//    static var example: Card {
//        Card(users: ["Fandika", "Ikhsan"])
//    }
//
//    func delete(at offsets: IndexSet) {
//        users.remove(atOffsets: offsets)
//    }
//
//}
//
//struct CardList: View {
//
//    let card: Card
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(card.users, id: \.self) { user in
//                    Text(user)
//                }
//                .onDelete(perform: card.delete)
//            }
//        }
//    }
//}

struct ListVIew: View {
    
    //    let card: Card
    //
    var body: some View {
        
        NavigationView {
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
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.yellow, lineWidth: 1)
                )
                
                
                Spacer()
                
            }
            
            //        .padding()
            ////        Color pada border itu berparameter.
            //        .border(Color.black)
        }
        .navigationTitle("Stok Available")
        .border(Color.yellow)
        
        
        
        
    }
    
}

struct StokView_Previews: PreviewProvider {
    static var previews: some View {
        StokView(text: .constant(""))
    }
}
