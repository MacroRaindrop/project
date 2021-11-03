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
        guard let url = URL(string: "https://be-raindrop-app.herokuapp.com/login") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let registers = try! JSONDecoder().decode([Register].self, from: data!)
            DispatchQueue.main.async {
                completion(registers)
            }
        }.resume()
    }
}

