//
//  Product.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 29/10/21.
//

import Foundation
import SwiftUI

struct Product: Codable {
    var id: Int
    var created_at: String
    var id_company: Int
    var name: String
    var minimum_stock: Int
    var image: String
    var unit: String
    var description: String
    var quantity: Int
}
