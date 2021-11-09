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
            
            ScrollView {
                
                VStack(spacing: 16) {
                    
                    PurchaseOrder()
                    
                    Inbound()
                    
                    Outbound()
                    
                    
                }
                .navigationTitle("Pesanan")
            }
        }
    }
}

struct updateView_Previews: PreviewProvider {
    static var previews: some View {
        updateView()
    }
}

struct PurchaseOrder: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12.0){
            Text("Purchase Order")
                .font(.title3)
                .fontWeight(.medium)
            Text("Buat PO baru dan lihat list barang yang akan di pesan")
                .opacity(0.6)
            HStack{
                Spacer()
                Image("POicon")
                    .resizable(capInsets: EdgeInsets())
                    .frame(width: /*@START_MENU_TOKEN@*/135.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/75.0/*@END_MENU_TOKEN@*/)
                    .opacity(1.8)
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .frame(width: /*@START_MENU_TOKEN@*/361.0, height: 231.0/*@END_MENU_TOKEN@*/)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("SecondaryButton")/*@END_MENU_TOKEN@*/)
        .cornerRadius(15.0)
    }
}

struct Inbound: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6){
            Text("Inbound")
                .font(.title3)
                .fontWeight(.medium)
            Text("Cek barang yang akan masuk")
                .opacity(0.6)
            HStack{
                Spacer()
                Image("InboundIcon")
                    .resizable(capInsets: EdgeInsets())
                    .frame(width: 105, height: 62)
                    .opacity(1.8)
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .frame(width: /*@START_MENU_TOKEN@*/361.0, height: 148.0/*@END_MENU_TOKEN@*/)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("SecondaryButton")/*@END_MENU_TOKEN@*/)
        .cornerRadius(15.0)
    }
}

struct Outbound: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6){
            Text("Outbound")
                .font(.title3)
                .fontWeight(.medium)
            Text("Buat list barang yang akan keluar")
                .opacity(0.6)
            HStack{
                Spacer()
                Image("OutboundIcon")
                    .resizable(capInsets: EdgeInsets())
                    .frame(width: 97, height: 57)
                    .opacity(1.8)
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .frame(width: /*@START_MENU_TOKEN@*/361.0, height: 148.0/*@END_MENU_TOKEN@*/)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("SecondaryButton")/*@END_MENU_TOKEN@*/)
        .cornerRadius(15.0)
    }
}
