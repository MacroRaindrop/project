//
//  InboundBerhasilView.swift
//  Mavible
//
//  Created by Rostadhi Akbar, M.Pd on 19/11/21.
//

import Foundation
import SwiftUI

struct inboundBerhasilView: View {
    @State private var note: String = ""
    @State var editingMode: Bool = false
    
    var body: some View {
        VStack(){
            detailPOberhasil()
            tableInbound() .padding(.vertical, 20)
            //notesPO()
            notesBerhasil(note: self.$note, editingMode: $editingMode) .padding(.bottom, 10)//.disabled(true)
            Button(action: {
                print("berhasil konfirmasi")
            }){
                kembaliButton()
            }
            
            //konfirmasiButton
           // cekLagiButton
            
            
        }
    }
}

struct inboundBerhasilView_Previews: PreviewProvider {
    static var previews: some View {
        inboundBerhasilView()
    }
}

struct detailPOberhasil : View {
    var body: some View{
        Text("PO1 Berhasil Diterima").bold().font(.title2)
            .padding(.horizontal)
            .padding(.bottom)
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
    }
}

struct kembaliButton : View {
    var body: some View {
        return Text("Kembali")
            .frame(maxWidth: 330, maxHeight: 20)
            .font(.system(size: 20))
            .padding()
            .foregroundColor(.black)
            .background(Color.ui.raindrop1)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct notesBerhasil : View {
    
    @Binding var note: String
    
    @Binding var editingMode: Bool
    
    var body: some View {
        
        
        VStack{
            Text("Notes:").frame(width: 350, alignment: .leading)
            TextField("", text: $note, onEditingChanged: {edit in
                if edit == true
                {self.editingMode = true}
                else
                {self.editingMode = false}
            })
                .frame(width: 350, height: 70, alignment: .topLeading)
                .textFieldStyle(PlainTextFieldStyle())
                .cornerRadius(10)
                .disabled(true)
                
                
                
            
            //.textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black).background(Color.gray).opacity(0.3))
                
        }
    }
}
