//
//  inboundConfirmation.swift
//  TestGround
//
//  Created by vincent meidianto on 09/11/21.
//

import SwiftUI

struct inboundConfirmation: View {
    @State private var note: String = ""
    @State var editingMode: Bool = false
    
    var body: some View {
        VStack(){
            detailPO() //.padding(.vertical, 20)
            tableInbound() .padding(.vertical, 20)
            //notesPO()
            notes(note: self.$note, editingMode: $editingMode) .padding(.bottom, 10)
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

struct inboundConfirmation_Previews: PreviewProvider {
    static var previews: some View {
        inboundConfirmation()
    }
}

struct tableInbound: View{
    var body: some View{
        VStack{
            HStack{
                
                Text("Nama Item").bold()
                Spacer()
                Text("Jumlah").bold()
            }.padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 5)
            
            HStack{
                Text("Kelapa Kering")
                Spacer()
                Text("100")
            }.padding(.horizontal, 20)
                .padding(.bottom, 2)
                
            
            HStack{
                Text("Minyak Kelapa")
                Spacer()
                Text("10")
            }.padding(.horizontal, 20)
                .padding(.bottom, 2)
            
            HStack{
                Text("Madu")
                Spacer()
                Text("35")
            }.padding(.horizontal, 20)
            Spacer()
        } .border(CustomColor.raindropColor,width: 5) .frame(width: 350, height: 300, alignment: .leading)
            .cornerRadius(10)
        
    }
}

struct notesPO : View{
    @State private var backgroundColor: Color = .white
    
    var body: some View{
        VStack{
            Text("Notes:").frame(width: 350, alignment: .leading)
            Rectangle().foregroundColor(Color.white) .frame(width: 350, height: 50)
                .border(Color.black,width: 1)
                .cornerRadius(10)
                
            
        }
    }
}

struct konfirmasiButton : View {
    var body: some View {
        return Text("Konfirmasi")
            .frame(maxWidth: 330, maxHeight: 20)
            .font(.system(size: 20))
            .padding()
            .foregroundColor(.black)
            .background(Color.ui.raindrop1)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct cekLagiButton : View {
    var body: some View {
        return Text("Cek lagi")
            .frame(maxWidth: 330, maxHeight: 20)
            .font(.system(size: 20))
            .padding()
            .foregroundColor(.black)
            .background(CustomColor.raindrop2)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension Color {
    static let ui = Color.UI()
    
    struct UI {
         let raindrop1 = Color("raindrop1")
        let raindrop2 = Color("raindrop2")
    }
}

struct notes : View {
    
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
            
            //.textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
        }
    }
}
