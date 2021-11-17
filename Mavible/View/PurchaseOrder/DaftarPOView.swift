//
//  daftarPO.swift
//  TestGround
//
//  Created by vincent meidianto on 09/11/21.
//

import SwiftUI


struct daftarPO: View {
    var body: some View {
        NavigationView {
            List(0 ..< 10) { item in
                HStack {
                    Text("PO1")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("PT binjai")
                    NavigationLink(destination: POdetail()){
                    }
                }
                .padding()
                .listRowBackground(Color.ui.raindrop2)
            }
            .listStyle(PlainListStyle())
            .cornerRadius(10)
            .padding()
        }
        .navigationBarTitle("Daftar PO")
    }
}
struct daftarPO_Previews: PreviewProvider {
    static var previews: some View {
        daftarPO()
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
