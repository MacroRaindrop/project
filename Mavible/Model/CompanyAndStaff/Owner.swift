//
//  Owner.swift
//  Mavible
//
//  Created by Rostadhi Akbar, M.Pd on 23/11/21.
//

import Foundation
import SwiftUI


struct Owner: Codable {
    var detail: [Detail]
    
    enum CodingKeys: String, CodingKey {
     case detail = "detail"
    }
}

struct Detail: Codable {
    var location: String
    var message: String
    var type: String
}
