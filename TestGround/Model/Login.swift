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
    var name: String
    var password: String
}

class APILogin: ObservableObject{
    //isi kodingan
    @Published var login = [Login]()
    
    func loadDataAPILogin(completion: @escaping ([Login]) -> ()) {
        //isi url & url session
    }
}
