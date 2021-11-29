//
//  Product.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 29/10/21.
//

import Foundation

struct Product: Codable, Identifiable{
    var id: Int
    var created_at: String
    var id_company: Int
    var name: String
    var minimum_stock: Int
    var image: String
    var unit: String
    var description: String
    var quantity: Int
    
//    static let `default` = Self(id: 0, created_at: "created_at", id_company: 0, name: "name", minimum_stock: 0, image: "image", unit: "unit", description: "description", quantity: 0)
    
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case created_at = "created_at"
//        case id_company = "id_company"
//        case name = "name"
//        case minimum_stock = "minimum_stock"
//        case image = "image"
//        case unit = "unit"
//        case description = "description"
//        case quantity = "quantity"
//    }
}

struct Rumah: Codable, Identifiable {
    var nama: String
    var id: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "abvasdv"
    }
}
