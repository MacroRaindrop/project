//
//  addDetailView.swift
//  TestGround
//
//  Created by Agni Muhammad on 02/11/21.
//

import SwiftUI
import Combine
import Camera_SwiftUI



struct AddDetailView: View {
    
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    
    @State var showCaptureImageView: Bool = false
    @Binding var showModal: Bool
    //@State private var namaProduk: String = ""
    
    //TODO Nambah array + nambah fungsi buat ngirim array ke DB
    var unit = ["liter", "kg", "karton"]
    @State private var unitSelected = "liter"
    
    @State var namaNull: Bool = true
    @State var jumlahNull: Bool = true
    @State var minNull: Bool = true
    
    @ObservedObject var namaProduk = TextBindingManager(limit: 20)
    
    @State var namaItem: String = ""
    @State var image: Image? = Image("InboundIcon")
    @State var jumlahProduk : String = ""
    @State var jumlahMinimalStok : String = ""
    @State var notesDeskripsi: String = ""
    @State var imageName: String = ""
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    
    @ObservedObject var fetchProduct = APIProduct()
    
    
    
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                HStack {
                    Button("Batal") {
                        self.showModal.toggle()
                    }
                    .padding()
                    .foregroundColor(.red)
                    Spacer()
                    Button(action: {
                        if authenticationDidSucceed {
                            self.fetchProduct.addProduct(product: )
                        } else {
                            print("gagal menambah produk")
                        }
                    }) {
                        Text("Simpan")
                            .foregroundColor(.blue)
                    }
                    .disabled(jumlahProduk.isEmpty || jumlahMinimalStok.isEmpty)
                    .padding()
                }
                HStack {
                    Text("Nama Produk")
                        .padding()
                    TextField("Masukkan nama barang", text: self.$namaItem)
                        .font(.system(size: 14))
                        .frame(width: 193, height: 40, alignment: .trailing)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 15)
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                        .padding([.horizontal], 2)
                }
                //                NavigationLink(destination: CameraView()){
                //                    Text("Tap to select a picture")
                //                }.frame(maxWidth: 344, maxHeight: 220)
                //                    .font(.system(size: 14))
                //                    .padding()
                //                    .foregroundColor(.white)
                //                    .background(Color.gray)
                //                    .clipShape(RoundedRectangle(cornerRadius: 20))
                //                    .padding()
                //                Button(action: {
                //                    //self.showCaptureImageView.toggle()
                //
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
                ////
                //                   }
                image!
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 344, height: 220)
                    .textFieldStyle(PlainTextFieldStyle())
                //                    .padding()
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                //                    .padding([.horizonta)
                //                    .frame(width: 344, height: 220)
                //                    .clipShape(Circle())
                //                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .padding()
                    .shadow(radius: 10)
                    .onTapGesture { self.shouldPresentActionScheet = true }
                    .sheet(isPresented: $shouldPresentImagePicker) {
                        SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image, isPresented: self.$shouldPresentImagePicker)
                    }.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
                        ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your profile image"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                            self.shouldPresentImagePicker = true
                            self.shouldPresentCamera = true
                        }), ActionSheet.Button.default(Text("Photo Library"), action: {
                            self.shouldPresentImagePicker = true
                            self.shouldPresentCamera = false
                        }), ActionSheet.Button.cancel()])
                    }
                //                if (showCaptureImageView) {
                //                        CaptureImageView(isShown: $showCaptureImageView, image: $image)
                //                      }
                VStack(alignment: .leading, spacing: 1){
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
                    VStack{
                        TextField("Masukkan notes dan deskripsi produk", text: self.$notesDeskripsi)
                            .font(.system(size: 14))
                            .frame(width: 344, height: 80, alignment: .topLeading)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(5)
                            .cornerRadius(20)
                            .overlay(RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray))
                            .fixedSize(horizontal: false, vertical: true)
                            .padding([.horizontal])
                    }
                }
                Spacer()
            }
        }
    }
}

struct addDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddDetailView(showModal: .constant(true))
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
