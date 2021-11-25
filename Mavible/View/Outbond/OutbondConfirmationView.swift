//
//  OutbondConfirmationView.swift
//  Mavible
//
//  Created by Fandika Ikhsan on 11/11/21.
//

import SwiftUI

struct OutbondConfirmationView: View {
    @State var note: String = ""
    @State var editingMode: Bool = false
    @State var isRusak: Bool = false
    
    
    var body: some View {
        VStack(spacing: 10){
            detailOutbond()
            tableInbound()
            //notesPO()
            
            CheckView(title: "Barang keluar karena rusak/kadeluasra")
                .foregroundColor(.black)
                .frame(width: 350, height: 20, alignment: .leading)
            
            
            notes(note: self.$note, editingMode: $editingMode)

            
            // Kondisi ketika checked
            Text("Harap isi penyebab barang rusak / kadeluarsa")
                .font(.caption)
                .italic()
                .frame(width: 350, height: 20, alignment: .leading)
            
            
            Button(action: {
                print("berhasil konfirmasi")
            }){
                konfirmasiButton()
            }
            Button(action: {
                print("berhasil cek")
            }){
                cekLagiButton()
            }
            //konfirmasiButton
            // cekLagiButton
            
            
        }
    }
}

struct OutbondConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        OutbondConfirmationView()
    }
}

struct detailOutbond : View {
    var body: some View{
        Text("Barang Keluar").bold().font(.title2)
            .padding()
        //padding()
        VStack(alignment: .leading){
            HStack (spacing: 70) {
                Text("Tanggal")
                    .padding(.bottom, 1)
                Text("4 november 2021")
                
            }
            HStack (spacing: 103){
                Text("PIC")
                
                Text("Abdul")
            }
            
        }.frame(width: 350, alignment: .leading)
    }
}

struct CheckView: View {
   @State var isChecked:Bool = false
   var title:String
    
   func toggle(){isChecked = !isChecked}
   var body: some View {
       Button(action: toggle){
           HStack{
               Image(systemName: isChecked ? "checkmark.square": "square")
               Text(title)
           }

       }

   }

}
