//
//  APIRegister.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 02/11/21.
//

import Foundation
import Combine
import SwiftUI

class APIRegister: ObservableObject{
    //isi kodingan
    @Published var register = [Register]()
    
    func loadDataAPIRegister(completion: @escaping ([Register]) -> ()) {
        //isi url & url session
    }
}

