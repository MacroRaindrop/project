//
//  Stock.swift
//  StockList
//
//  Created by Rostadhi Akbar, M.Pd on 21/10/21.
//

import SwiftUI

struct Stock: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var total: Int
    var imageName: String { return name }
}

let dummyData = [
    Stock(name: "Sabun", description: "Cuci Piring", total: 100),
]
