//
//  Product.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 29/10/21.
//

import Foundation
import SwiftUI

struct Product: Hashable, Codable, Identifiable {
    var id: UUID
    var newProduct: String
    var detailProduct: String
    var inboundProduct: String
    var outboundProduct: String
    var purchaseOrder: String
    var image: String?
    var datePurchased: Date
}
