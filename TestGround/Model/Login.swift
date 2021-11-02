//
//  Login.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 29/10/21.
//

import SwiftUI
import Foundation

struct Login: Hashable, Codable, Identifiable {
    var id: UUID
    var username: String
    var password: String
}


