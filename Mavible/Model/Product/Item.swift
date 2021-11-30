//
//  Item.swift
//  Mavible
//
//  Created by Rostadhi Akbar, M.Pd on 30/11/21.
//

import Foundation

struct Item: Codable {
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
