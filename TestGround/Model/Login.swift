//
//  Login.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 29/10/21.
//

import SwiftUI
import Foundation

struct Login : Codable, Identifiable {
    var id = UUID()
    var email: String
    var success: Bool
    var password: String
    
}


