//
//  Register.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 29/10/21.
//

import Foundation
import SwiftUI

struct Register: Codable, Identifiable {
    let id: Int
    let createdDate: String
    let ownerName: String
    let staffName: String
    let ownerEmail: String
    let password: String
    
    static let `default` = Self(id: 0, createdDate: "created_at",ownerName: "owner_name", staffName: "name", ownerEmail: "owner_email", password: "owner_password")
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdDate = "created_at"
        case ownerName = "owner_name"
        case staffName = "name"
        case ownerEmail = "owner_email"
        case password = "owner_password"
    }
}

