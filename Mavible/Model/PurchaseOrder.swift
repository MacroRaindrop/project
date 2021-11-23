//
//  PurchaseOrder.swift
//  Mavible
//
//  Created by Rostadhi Akbar, M.Pd on 23/11/21.
//

import Foundation
import SwiftUI

struct PurchaseOrder: Codable {
    var id_company: Int
    var id_staff: Int
    var supplier: String
    var date: String
    var products
}
struct Products: Codable{
    var id_product: Int
    var quantity: Int
}
