//
//  POConfirmationView.swift
//  Mavible
//
//  Created by Nathanael DJ on 25/11/21.
//

import SwiftUI

struct POConfirmationView: View {
    @State private var note: String = ""
    @State var editingMode: Bool = false
    @State private var backgroundColor: Color = .white
    
    var body: some View {
        VStack{
            detailPO()
            //tabel
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
                .padding(.vertical, 20)
            //notes
            VStack{
                Text("Notes:").frame(width: 350, alignment: .leading)
                Rectangle().foregroundColor(Color.white) .frame(width: 350, height: 50)
                    .border(Color.black,width: 1)
                    .cornerRadius(10)
                //buttons
                Button(action: {
                    print("berhasil konfirmasi")
                }){
                    Text("Konfirmasi")
                        .frame(maxWidth: 330, maxHeight: 20)
                        .font(.system(size: 20))
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.ui.raindrop1)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Button(action: {
                    print("cek lagi")
                }){
                    Text("Cek lagi")
                        .frame(maxWidth: 330, maxHeight: 20)
                        .font(.system(size: 20))
                        .padding()
                        .foregroundColor(.black)
                        .background(CustomColor.raindrop2)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}

struct POConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        POConfirmationView()
    }
}
