//
//  Register.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 29/10/21.
//

import Foundation
import SwiftUI

struct Register: Hashable, Codable, Identifiable {
    var id: UUID
    var username: String
    var email: String
    var company: String
    var password: String
    var repeatPassword: String
}

