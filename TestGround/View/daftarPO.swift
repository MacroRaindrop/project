//
//  daftarPO.swift
//  TestGround
//
//  Created by vincent meidianto on 09/11/21.
//

import SwiftUI

struct daftarPO: View {
    var body: some View {
        VStack{
            Text("Daftar PO").bold().font(.title)
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
    var body: some View {
    
            List(0 ..< 3) { item in
                HStack {
                    
                    VStack (alignment: .leading, spacing: 5) {
                        Text("kelapa kering")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text("PT binjai")
                        
                    }
                    
                    NavigationLink(destination: POdetail()){
                        
                    }
                    
                    
                } //.background(Color.ui.raindrop1)
                    .padding()
                //                .overlay(
                //                        RoundedRectangle(cornerRadius: 3)
                //                            .stroke(Color.white, lineWidth: 1)
                //                )
            }.background(Color.ui.raindrop1)
        } //.scaledToFit()
        
    
}
