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
    @State var jumlahProduk : String = ""
    @State var jumlahMinimalStok : String = ""
    @State private var notesDeskripsi: String = ""
    var unit = ["liter", "kg", "karton"]
    @State private var unitSelected = "liter"
    
    
    var body: some View {
        VStack(alignment: .leading){
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
                    
                    
//                    TextField("Nama Produk", text: $namaProduk)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding()
//                        .frame(width:193.0, height: 40)
//                        .padding()
                    
                    TextField("Masukkan nama barang", text: self.$namaProduk)
                        .font(.system(size: 14))
                        .frame(width: 193, height: 40, alignment: .trailing)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 15)
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                        .padding([.horizontal], 2)
                    

                      
    
                       
                 
                }
                
                Button(action: {
                       print("Camera is Showed/Photos Library")
                   }) {
                       Text("Tap to select a picture")
                           .frame(maxWidth: 344, maxHeight: 220)
                           .font(.system(size: 14))
                           .padding()
                           .foregroundColor(.white)
                           .background(Color.gray)
                           .clipShape(RoundedRectangle(cornerRadius: 20))
                           .padding()
                           
                   }
                
            VStack(alignment: .leading){
                    HStack{
                        
                        Text("Jumlah")
                            .padding()
                        
//                        TextField("0", text: $jumlahProduk)
//                            .keyboardType(.numberPad)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
                        
                        TextField("0", text: self.$jumlahProduk)
                            .font(.system(size: 14))
                            .frame(height: 34)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 10)
                            .cornerRadius(20)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                            .padding([.horizontal], 2)
                        
                        Picker("please choose a unit", selection: $unitSelected){
                            ForEach(unit, id: \.self){
                                Text($0)
                            }
                            
                        }
                        .padding()
                    }
                    
                    Text("Masukkan jumlah stok yang tersedia saat ini")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                        .padding()
                    
                    HStack{
                        Text("Minimal Stok")
                            .padding()
                        
//                        TextField("0", text: $jumlahMinimalStok)
//                            .keyboardType(.numberPad)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
                        
                        TextField("0", text: self.$jumlahMinimalStok)
                            .font(.system(size: 14))
                            .frame(height: 34)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 10)
                            .cornerRadius(20)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                            .padding([.horizontal])
                        
                    }
                    
                    Text("Masukkan jumlah minimum stok untuk diingatkan saat statusnya low")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                    
                    HStack{
                        Text("Notes/Desc")
                            .padding()
                        
                    }
                    
                    TextField("Masukkan notes dan deskripsi produk", text: self.$notesDeskripsi)
                            .font(.system(size: 14))
                            .frame(width: 347, height: 101, alignment: .topLeading)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(5)
                            .cornerRadius(20)
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                            .fixedSize(horizontal: false, vertical: true)
                            .padding([.horizontal])
                        

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
