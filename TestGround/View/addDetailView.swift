//
//  addDetailView.swift
//  TestGround
//
//  Created by Agni Muhammad on 02/11/21.
//

import SwiftUI
import Camera_SwiftUI



struct addDetailView: View {
    @State var showCaptureImageView: Bool = false
    @ObservedObject var namaProduk = TextBindingManager(limit: 20)
    @Binding var showModal: Bool
    @State var image: Image? = nil
    //@State private var namaProduk: String = ""
    @State var jumlahProduk : String = ""
    @State var jumlahMinimalStok : String = ""
    @State private var notesDeskripsi: String = ""
    var unit = ["liter", "kg", "karton"]
    @State private var unitSelected = "liter"
    
    @State var namaNull: Bool = true
    @State var jumlahNull: Bool = true
    @State var minNull: Bool = true
    
    
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
//
//                    if namaNull {
//                        Text("nama produk tidak boleh kosong")
//                            .offset(y: -10)
//                            .foregroundColor(.red)
//                    }
//                    else if jumlahNull {
//                        Text("jumlah tidak boleh kosong")
//                            .offset(y: -10)
//                            .foregroundColor(.red)
//                    }
//                    else if minNull {
//                        Text("minimal stok tidak boleh kosong")
//                            .offset(y: -10)
//                            .foregroundColor(.red)
//                    }
                    
                    //validasi
//                    if namaProduk.isEmpty{
//                        namaNull = true
//                    }else{
//                        namaNull = false
                    //}
                    if jumlahProduk.isEmpty{
                        jumlahNull = true
                    }else{
                        jumlahNull = false
                    }
                    if jumlahMinimalStok.isEmpty{
                        minNull = true
                    }else{
                        minNull = false
                    }
                    
                    //validasi semua hrs di isi
                    
                } .disabled(namaNull == true || jumlahNull == true || minNull == true) // || image == nil)
                .padding()
                    
                    
                }
                
                HStack {
                    
                    Text("Nama Produk")
                        .padding()
                    
                    
                    TextField("Nama Produk", text: $namaProduk.text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .frame(width:193, height: 40)
                        .padding()
                      
    
                       
                 
                }
                NavigationLink(destination: CameraView()){
                    Text("Tap to select a picture")
                }.frame(maxWidth: 344, maxHeight: 220)
                    .font(.system(size: 14))
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
//                Button(action: {
//                    //self.showCaptureImageView.toggle()
//
//                   }) {
//                       Text("Tap to select a picture")
//                           .frame(maxWidth: 344, maxHeight: 220)
//                           .font(.system(size: 14))
//                           .padding()
//                           .foregroundColor(.white)
//                           .background(Color.gray)
//                           .clipShape(RoundedRectangle(cornerRadius: 20))
//                           .padding()
//
//                   }
//                if (showCaptureImageView) {
//                        CaptureImageView(isShown: $showCaptureImageView, image: $image)
//                      }
                
                VStack {
                    HStack{
                        
                        Text("Jumlah")
                            .padding()
                        
                        TextField("0", text: $jumlahProduk)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
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
                        
                        TextField("0", text: $jumlahMinimalStok)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        
                    }
                    
                    Text("Masukkan jumlah minimum stok untuk diingatkan saat statusnya low")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                        .padding()
                    
                    HStack{
                        Text("Notes/Desc")
                            .padding()
                        Spacer()
                        
                    }
                    
                    TextField("Masukkan Deskripsi Produk", text: $notesDeskripsi)
                        .padding(.all, 20)
                        .font(.system(size: 14))
                        .frame(width:347, height: 100)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding()

                    }
                
            Spacer()
        }
    }
}
}

struct addDetailView_Previews: PreviewProvider {
    static var previews: some View {
           addDetailView(showModal: .constant(true))
    }
}

//struct CaptureImageView {
//    
//    /// MARK: - Properties
//    @Binding var isShown: Bool
//    @Binding var image: Image?
//    
//    func makeCoordinator() -> Coordinator {
//      return Coordinator(isShown: $isShown, image: $image)
//    }
//}
//
//extension CaptureImageView: UIViewControllerRepresentable {
//    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
//        let picker = UIImagePickerController()
//        picker.delegate = context.coordinator
//        //picker.sourceType = .camera
//        return picker
//    }
//    
//    func updateUIViewController(_ uiViewController: UIImagePickerController,
//                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
//        
//    }
//}
