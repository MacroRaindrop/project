//
//  addDetailView.swift
//  TestGround
//
//  Created by Agni Muhammad on 02/11/21.
//

import SwiftUI



struct addDetailView: View {
    @Binding var showModal: Bool
    @State var image: Image? = nil
    @State private var namaProduk: String = ""
    @State var jumlahProduk : String = "0"
    @State var jumlahMinimalStok : String = "0"
    @State private var notesDeskripsi: String = ""
    
    
    var body: some View {
        VStack {
            VStack{
                HStack {
                
                Button("Batal") {
                    self.showModal.toggle()
                }
                .padding()
                .foregroundColor(.red)
                    
                    Spacer()
                
                Button("Simpan"){
                    print("sudah tersimpan")
                }
                .padding()
                    
                    
                }
                
                HStack {
                    
                    Text("Nama Produk")
                        .padding()
                    
                    
                    TextField("Nama Produk", text: $namaProduk)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .frame(width:193, height: 40)
                        .padding()
                      
                    
                       
                 
                }
                
                Button(action: {
                       print("Camera is Showed/Photos Library")
                   }) {
                       Text("Tap to select a picture")
                           .frame(maxWidth: 344, maxHeight: 220)
                           .font(.system(size: 20))
                           .padding()
                           .foregroundColor(.white)
                           .background(Color.gray)
                           .clipShape(RoundedRectangle(cornerRadius: 20))
                           .padding()
                           
                   }
                
                VStack {
                    HStack{
                        
                        Text("Jumlah")
                            .padding()
                        
                        TextField("Total Produk yang tersedia", text: $jumlahProduk)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        //picker
                        
                    }
                    
                    Text("Masukkan jumlah stok yang tersedia saat ini")
                        .foregroundColor(.gray)
                        .padding()
                    
                    HStack{
                        Text("Minimal Stok")
                            .padding()
                        
                        TextField("Stok Minimal", text: $jumlahMinimalStok)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    }
                    
                    Text("Masukkan jumlah minimum stok untuk diingatkan saat statusnya low")
                        .foregroundColor(.gray)
                        .padding()
                    
                    HStack{
                        Text("Notes/Desc")
                            .padding()
                        Spacer()
                        
                    }
                    
                    TextField("", text: $namaProduk)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.all, 20)
                        .frame(width:347, height: 101)
                        .padding()
                    
                    }
                
            Spacer()
        }
    }
}


struct addDetailView_Previews: PreviewProvider {
    static var previews: some View {
           addDetailView(showModal: .constant(true))
       }
   }
}
