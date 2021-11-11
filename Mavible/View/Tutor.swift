//
//  Tutor.swift
//  Tutors
//
//  Created by Sai Kambampati on 6/5/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import SwiftUI

struct Tutor: Identifiable {
    var id = UUID()
    var name: String
    var supplier: String
    
    
    
}

#if DEBUG
let testData = [
    Tutor(name: "PO1", supplier: "pt dari binjai"),
    Tutor(name: "PO2", supplier: "pt bahagia tiap hari"),
    Tutor(name: "PO1", supplier: "pt suka uang"),
]
#endif
