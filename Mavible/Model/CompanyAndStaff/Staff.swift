//
//  Staff.swift
//  Mavible
//
//  Created by Rostadhi Akbar, M.Pd on 23/11/21.
//

import Foundation
import SwiftUI

struct Staff: Codable {
    var id_company: Int
    var name: String
    var email: String
    var password: String
    var role: String
    
    enum CodingKeys: String, CodingKey{
        case id_company = "id_company"
        case name = "name"
        case email = "email"
        case password = "password"
        case role = "role"
    }
}
