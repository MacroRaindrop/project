//
//  daftarPO.swift
//  TestGround
//
//  Created by vincent meidianto on 09/11/21.
//

import SwiftUI


struct daftarPO: View {
    
    var body: some View {
        
//        var Position : String
//        let positions = [
//            Position(id: 1, name: "First"),
//            Position(id: 2, name: "Second"),
//            Position(id: 3, name: "Third")
//        ]
        VStack{
            Text("Daftar PO").bold().font(.title).frame(width: 350,height: 200, alignment: .bottomLeading)
                .multilineTextAlignment(.leading)
            listPO()
        }
    }
}

struct daftarPO_Previews: PreviewProvider {
    static var previews: some View {
        daftarPO()
    }
}

struct listPO: View {
    @State var editingMode2: Bool = false
    @State private var jumlah: String = ""
    var tutors: [Tutor] = []
    var body: some View {
        NavigationView {
            
            
            
//            List(positions, rowContent: { position in
//                Text(position.name)
//            })
//                .font(.largeTitle)
//            List(tutors) { tutor in
//                TutorCell(tutor: tutor)
//            }
            
        List(0 ..< 3) { item in
            HStack {

                VStack (alignment: .leading, spacing: 5) {
                    Text("kelapa kering")
                        .font(.title3)
                        .fontWeight(.semibold)

                    Text("PT binjai")

                }

                NavigationLink(destination: POdetail()){

                }


            }
            .padding(.top, 10)
            
            .listRowBackground(Color.ui.raindrop2)
            
            
            
            
            //                .overlay(
            //                        RoundedRectangle(cornerRadius: 3)
            //                            .stroke(Color.white, lineWidth: 1)
            //                )
        }
        .listStyle(PlainListStyle())
        .cornerRadius(10)
        
        .padding()
        
    } //.scaledToFit()
    
}
}


struct TutorCell : View {
    let tutor: Tutor
    var body: some View {
        return NavigationLink(destination: POdetail()) {
            VStack(alignment: .leading) {
                Text(tutor.name)
                Text(tutor.supplier)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
