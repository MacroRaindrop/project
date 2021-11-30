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
//    @Binding var showModal: Bool
    //@State private var namaProduk: String = ""
    
    //TODO Nambah array + nambah fungsi buat ngirim array ke DB
    var unit = ["liter", "kg", "karton"]
    @State private var unitSelected = "liter"
    
    @State var namaNull: Bool = true
    @State var jumlahNull: Bool = true
    @State var minNull: Bool = true
    
    @ObservedObject var namaProduk = TextBindingManager(limit: 20)
    
    @State var namaItem: String = ""
    
    //Image Dumb
    @State var image: Image? = Image("InboundIcon")
    @State var jumlahProduk : Int = 0
    @State var jumlahMinimalStok : Int = 0
    @State var notesDeskripsi: String = ""
    
    //Buat Masukin Imagenya
    @State var imageName: String = ""
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = true
    
    
    @ObservedObject var fetchProduct = APIProduct()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 16){
                HStack {
                    Button("Batal") {
//                        self.showModal.toggle()
                        dismiss()
                    }
                    .padding()
                    .foregroundColor(.red)
                    Spacer()
                    Button(action: {
                        if authenticationDidSucceed {
                            
                            //TODO nyambungin API sama masukin Image
                            var newProduct: Item?
                            newProduct?.name = self.namaItem
                            newProduct?.quantity = self.jumlahProduk
                            newProduct?.minimum_stock = self.jumlahMinimalStok
                            newProduct?.description = self.notesDeskripsi
//                            fetchProduct.name = newProduct.
//                            newProduct.quantity = jumlahProduk
//                            newProduct.minimum_stock = jumlahMinimalStok
//                            newProduct.description = notesDeskripsi
//                            newProduct?.id = 0
//                            newProduct?.id_company = 0
//                            newProduct?.image = imageName
//                            newProduct?.created_at = ""
                            AddProductViewModel().addProduct(name: self.namaItem, quantity: self.jumlahProduk, minimum_stock: self.jumlahMinimalStok, description: self.notesDeskripsi)
//                            fetchProduct.addProduct(product: newProduct)
                            print("sukses")
                            //TODO Nyambungin ke image biar bisa disave
                        } else {
                            print("gagal menambah produk")
                        }
                        dismiss()
                    }) {
                        Text("Simpan")
                            .foregroundColor(.blue)
                    }.disabled(namaItem.isEmpty || jumlahProduk.words.isEmpty || jumlahMinimalStok.words.isEmpty)
                    .padding()
                }
                
                VStack (spacing: 12) {
                    HStack {
                        Text("Nama Produk")
                        
                        TextField("Masukkan nama barang", text: self.$namaItem)
                            .font(.system(size: 13))
                            .frame(width: 210, height: 34, alignment: .trailing)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 15)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                            .padding([.horizontal], 2)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                    //TODO nyambungin image ke api
                    image!
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 344, height: 220)
                        .textFieldStyle(PlainTextFieldStyle())
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
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
                }
                VStack(alignment: .leading, spacing: 32){
                    VStack(spacing:4) {
                        HStack{
                            Text("Jumlah**")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("ButtonFont"))
                            TextField("0", value: $jumlahProduk, formatter:  NumberFormatter())
                                .font(.system(size: 14))
                                .frame(height: 34)
                                .textFieldStyle(PlainTextFieldStyle())
                                .padding([.horizontal], 10)
                                .cornerRadius(20)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                            
                            Picker("please choose a unit", selection: $unitSelected){
                                ForEach(unit, id: \.self){
                                    Text($0)
                                }
                            }
                        }
                        
                        VStack(spacing: 2) {
                            Text("Masukkan jumlah stok yang tersedia saat ini")
                                .frame(maxWidth:.infinity, alignment: .leading)
                                
                            Text("**Unit dipilih berdasarkan kemasan produk, contoh: 2 dus isi @12 kaleng, maka jumlah yang diisi 24 kaleng")
                        }
                        .foregroundColor(CustomColor.buttonFont)
                        .opacity(0.4)
                        .font(.system(size: 13))
                    }
                    VStack(spacing: 4) {
                        HStack{
                            Text("Minimal Stok")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("ButtonFont"))
                            
                            TextField("0", value: $jumlahMinimalStok, formatter:  NumberFormatter())
                                .font(.system(size: 13))
                                .frame(height: 34)
                                .textFieldStyle(PlainTextFieldStyle())
                                .padding([.horizontal], 10)
                                .cornerRadius(20)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                        }
                        Text("Masukkan jumlah minimum stok untuk diingatkan saat statusnya low")
                            .foregroundColor(CustomColor.buttonFont)
                            .font(.system(size: 13))
                            .opacity(0.4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    VStack(spacing: 8) {
                        Text("Notes/Desc")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("ButtonFont"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Masukkan notes dan deskripsi produk", text: self.$notesDeskripsi)
                            .font(.system(size: 13))
                            .frame(width: 344, height: 80, alignment: .topLeading)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(5)
                            .cornerRadius(20)
                            .overlay(RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .padding()
            }
        } .navigationBarHidden(true)
    }
}

//struct addDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddDetailView(showModal: .constant(true), newProduct: Product())
//    }
//}

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
