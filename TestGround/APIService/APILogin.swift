//
//  APILogin.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 02/11/21.
//

import Foundation
import Combine
import SwiftUI

class APILogin: ObservableObject{
    //isi kodingan
    @Published var login = [Login]()
    
    func loadDataAPILogin(completion: @escaping ([Login]) -> ()) {
        //isi url & url session
    }
}
