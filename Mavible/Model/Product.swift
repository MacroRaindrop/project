//
//  Product.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 29/10/21.
//

import Foundation
import SwiftUI


struct Product: Codable {
    public var id: Int
    public var created_at: String
    public var id_company: Int
    public var name: String
    public var minimum_stock: Int
    public var image: String
    public var unit: String
    public var description: String
    public var quantity: Int
}
