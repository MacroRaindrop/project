//
//  Product.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 29/10/21.
//

import Foundation
import SwiftUI

struct Product: Hashable, Codable{
    var addProduct: String
    var detailProduct: String
    var inboundProduct: String?
    var outboundProduct: String?
    var purchaseOrder: String
    var imageURL: URL
    var datePurchased: Date
}
