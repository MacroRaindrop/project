//
//  Outbound.swift
//  Mavible
//
//  Created by Rostadhi Akbar, M.Pd on 25/11/21.
//

import Foundation
import SwiftUI
import Combine

struct OutBound: Codable {
    var id_company: Int
    var id_purchaseorder: Int
    var items: [Products]
    
    enum CodingKeys: String, CodingKey {
        case id_company = "id_company"
        case id_purchaseorder = "id_purchaseorder"
        case items = "products"
    }
}
