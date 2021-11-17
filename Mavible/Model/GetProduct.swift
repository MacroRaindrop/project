//
//  GetProduct.swift
//  Mavible
//
//  Created by Rostadhi Akbar, M.Pd on 12/11/21.
//

import Foundation
import SwiftUI
struct GetProduct: Codable {
    var id = UUID()
    var created_at: String
    var id_company: Int
    var name: String
    var minimum_stock: Int
    var image: String
    var unit: String
    var description: String
    var quantity: Int
}
