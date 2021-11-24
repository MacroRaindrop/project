//
//  updateView.swift
//  TestGround
//
//  Created by Agni Muhammad on 04/11/21.
//

import SwiftUI

struct UpdateView: View {
    var body: some View {
            ScrollView {
                VStack(spacing: 20) {
                    Text("")
                    NavigationLink(destination: POdetail() ) {
                    PurchaseOrder()
                    }
                    NavigationLink(destination: daftarPO() ) {
                        Inbound()
                    }
                    //                  NavigationLink(destination: Text("Destination")) {
                    //                        /*@PLACEHOLDER=Label Content@*/Text("Navigate")}
                    Outbound()
                }
                .navigationBarTitle("Pesanan")
                .navigationBarBackButtonHidden(true)
                .navigationBarTitleDisplayMode(.automatic)
            }
    }
}

struct updateView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateView()
    }
}

struct PurchaseOrder: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            Text("Purchase Order")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color("ButtonFont"))
            Text("Buat PO baru dan lihat list barang yang akan di pesan")
                .multilineTextAlignment(.leading)
                .opacity(0.6)
                .foregroundColor(.buttonFont)
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
            Text("Barang Masuk")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color("ButtonFont"))
            Text("Cek barang yang akan masuk")
                .opacity(0.6)
                .foregroundColor(.buttonFont)
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
            Text("Barang Keluar")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color("ButtonFont"))
            Text("Buat list barang yang akan keluar")
                .opacity(0.6)
                .foregroundColor(.buttonFont)
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
