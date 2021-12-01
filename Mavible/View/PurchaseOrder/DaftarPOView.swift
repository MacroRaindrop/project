//
//  daftarPO.swift
//  TestGround
//
//  Created by vincent meidianto on 09/11/21.
//

import SwiftUI


struct daftarPO: View {
    @ObservedObject var getPO = OrderService()
    var body: some View {
        NavigationView {
            List {
                ForEach(getPO.purchaseOrders, id: \.id_company) { item in
                    HStack {
                        VStack(alignment: .leading){
                            Text(item.date)
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(item.supplier) .foregroundColor(CustomColor.buttonFont)
                                .opacity(0.6)
                        }
                        NavigationLink(destination: POdetail()){
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.top, 10)
                    .listRowBackground(Color.ui.raindrop2)
                }
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
    var body: some View {
        return NavigationLink(destination: POdetail()) {
            VStack(alignment: .leading) {
                Text("name")
                Text("pt baju")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
