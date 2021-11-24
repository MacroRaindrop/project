//
//  PurchaseOrder.swift
//  Mavible
//
//  Created by Rostadhi Akbar, M.Pd on 23/11/21.
//

import Foundation
import SwiftUI

struct Order: Codable {
    var id_company: Int
    var id_staff: Int
    var supplier: String
    var date: String
    var products: [Products]
    
    enum CodingKeys: String, CodingKey {
        case id_company = "id_company"
        case id_staff = "id_staff"
        case supplier = "supplier"
        case date = "date"
        case products = "products"
    }
}
struct Products: Codable{
    var id_product: Int
    var quantity: Int
}
