//
//  Register.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 29/10/21.
//

import Foundation
import SwiftUI

struct Register: Hashable, Codable, Identifiable {
    var id = UUID()
    var owner_name: String
    var name: String
    var owner_email: String
    var owner_password: String
    var success: Bool
    

}

