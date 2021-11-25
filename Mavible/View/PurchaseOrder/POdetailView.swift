//
//  POdetail.swift
//  TestGround
//
//  Created by vincent meidianto on 09/11/21.
//

import SwiftUI
import Foundation
import Combine

struct POdetail: View {
    
    
    var body: some View {
        
        VStack{
            detailPO()
            POlist() .padding(.top)
            
            Text("Pastikan jumlah barang yang datang sama dengan yang tertulis").padding(.top, 50) .padding()
            cekButton()
        }
    }
}


struct POdetail_Previews: PreviewProvider {
    static var previews: some View {
        POdetail()
    }
}

struct POlist: View {
    @State var editingMode2: Bool = false
    @State private var jumlah: String = ""
    @State private var checked = false
    @State private var checkedAll = false
    
    var body: some View {
        //VStack{
            Button(action: {
//                CheckBoxView(checked: true, checkedAll: <#T##Binding<Bool>#>)
            checkedAll = true
            }) {
                Text("Pilih semua")
            }.frame(width: 350, alignment: .topTrailing)
        
            List(0 ..< 3) { item in
                HStack {
                    Image("OutboundIcon")
                        
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60, alignment: .leading)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                    
                    VStack (alignment: .leading, spacing: 5) {
                        Text("kelapa kering")
                            
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.top, 20)
                        
                        POTextfield(jumlah: $jumlah, editingMode2: $editingMode2)
                    }
                    CheckBoxView(checked: checked, checkedAll: $checkedAll)
                } .background(Color.white)
                    //.padding()
                //                .overlay(
                //                        RoundedRectangle(cornerRadius: 3)
                //                            .stroke(Color.white, lineWidth: 1)
                //                )
            }.listStyle(PlainListStyle())
        } //.scaledToFit()
        
   // }
}

struct cekButton : View {
    var body: some View {
        return Text("Cek")
            .frame(maxWidth: 300, maxHeight: 20)
            .scaledToFill()
            .font(.system(size: 20))
            .padding()
            .foregroundColor(.black)
            .background(CustomColor.raindrop1Color)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}

struct detailPO : View {
    var body: some View{
        Text("PO1").bold().font(.title2)
            .padding()
        //padding()
        VStack(alignment: .leading , spacing: 6){
            HStack (spacing: 70) {
                Text("Tanggal")
                
                Text("4 november 2021")
    
            }
            HStack (spacing: 103){
                Text("PIC")
                
                Text("Abdul")
            }
            HStack (spacing: 66){
                Text("Supplier")
                
                Text("PT binjai")
            }
        }.frame(width: 350, alignment: .leading)
            .navigationBarTitleDisplayMode(.inline)
    }
}
struct listTextfield : View {
    
    @Binding var username: String
    
    @Binding var editingMode: Bool
    
    var body: some View {
        return TextField("Type your email", text: $username, onEditingChanged: {edit in
            if edit == true
            {self.editingMode = true}
            else
            {self.editingMode = false}
        })
            .padding(.top, 20)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.none)
    }
}

struct POTextfield : View {
    
    @Binding var jumlah: String
    
    @Binding var editingMode2: Bool
    
    var body: some View {
        return TextField("100", text: $jumlah, onEditingChanged: {edit in
            if edit == true
            {self.editingMode2 = true}
            else
            {self.editingMode2 = false}
        })
            .cornerRadius(5.0)
            .padding(.bottom, 20)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.none)
//            .background(RoundedRectangle(cornerRadius: 5.0).fill(Color.gray))
            .foregroundColor(Color.gray)
    }
}
