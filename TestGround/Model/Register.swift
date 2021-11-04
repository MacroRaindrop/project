//
//  Register.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 29/10/21.
//


import SwiftUI
import Foundation

struct Register: Hashable, Codable{
    var owner_name: String
    var name: String
    var owner_email: String
    var owner_password: String
    var success: Bool
}

