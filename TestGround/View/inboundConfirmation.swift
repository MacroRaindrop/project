//
//  inboundConfirmation.swift
//  TestGround
//
//  Created by vincent meidianto on 09/11/21.
//

import SwiftUI

struct inboundConfirmation: View {
    var body: some View {
        VStack(spacing: 20){
                detailPO()
            tableInbound()
            notesPO()
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
        } .border(Color.raindropColor,width: 5) .frame(width: 350, height: 300, alignment: .leading)
            .cornerRadius(10)
        
    }
}

struct notesPO : View{
    var body: some View{
        VStack{
            Text("Notes:").frame(width: 350, alignment: .leading)
            Rectangle().foregroundColor(Color.white) .frame(width: 350, height: 100)
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
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct cekLagiButton : View {
    var body: some View {
        return Text("Cek lagi")
            .frame(maxWidth: 330, maxHeight: 20)
            .font(.system(size: 20))
            .padding()
            .foregroundColor(.black)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

extension Color {
    static let ui = Color.UI()
    
    struct UI {
         let raindrop1 = Color("raindrop1")
        let raindrop2 = Color("raindrop2")
    }
}
