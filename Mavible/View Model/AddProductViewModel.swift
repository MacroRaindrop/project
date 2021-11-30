//
//  AddProductViewModel.swift
//  Mavible
//
//  Created by Rostadhi Akbar, M.Pd on 29/11/21.
//

import Foundation
import SwiftUI
import Combine

class AddProductViewModel: ObservableObject {
    @ObservedObject var fetchProduct = APIProduct()
    @State var namaItem: String = ""
    @State var image: Image? = Image("InboundIcon")
    @State var jumlahProduk : Int = 0
    @State var jumlahMinimalStok : Int = 0
    @State var notesDeskripsi: String = ""
    @State var imageName: String = ""
    var newProduct: Item?
    
    func addProduct(name: String, quantity: Int, minimum_stock: Int, description: String){
        
        newProduct?.name = namaItem
        newProduct?.quantity = jumlahProduk
        newProduct?.minimum_stock = jumlahMinimalStok
        newProduct?.description = notesDeskripsi
        newProduct?.id = 0
        newProduct?.id_company = 0
        newProduct?.image = imageName
        newProduct?.created_at = ""
        
        fetchProduct.addProduct(product: newProduct!)
    }
}
