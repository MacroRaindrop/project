//
//  updateView.swift
//  TestGround
//
//  Created by Agni Muhammad on 04/11/21.
//

import SwiftUI

struct updateView: View {
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                ZStack{
                    VStack(alignment: .leading, spacing: 20){
                        Text("Purchase Order")
                        Text("Buat PO baru dan lihat list barang yang akan dipesan.")
                        Image("POicon")
                        
                        
                    }
                    .navigationTitle("Pesanan")
                }
            }
        }
    }
}

struct updateView_Previews: PreviewProvider {
    static var previews: some View {
        updateView()
    }
}
