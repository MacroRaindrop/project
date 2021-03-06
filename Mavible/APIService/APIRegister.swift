//
//  APIRegister.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 02/11/21.
//

import Foundation
import Combine
import SwiftUI
import SystemConfiguration

class APIRegister: ObservableObject{
    //isi kodingan
    var didChange = PassthroughSubject<APIRegister, Never>()
    
    
    @Published var owner_name: String = ""
    @Published var name: String = ""
    @Published var owner_email: String = ""
    @Published var owner_password: String = ""
    @Published var theAPIReachable : Bool = true {
        didSet {
            didChange.send(self)
        }
    }
    @Published var register: [Register] = []
    
    
    func registerCheck(owner_name: String, name: String, owner_email: String, owner_password: String) {
        
        //isi url & url session
        guard let url = URL(string: urlRegister ) else {
            return
        }
        
        let body : [ String : String] = ["owner_name" : owner_name, "name" : name, "owner_email" : owner_email, "owner_password" : owner_password]
        
        guard let finishedBody = try? JSONEncoder().encode(body)
        else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = finishedBody
        
        let task = URLSession.shared.dataTask(with: request, completionHandler:  { (data, response, error) in
            guard let data = data, error == nil else {
                print("Data Response Kosong")
                
                DispatchQueue.main.async {
                    self.theAPIReachable = false
                }
                return
            }
            
            print(response!)
            print(String(data: data, encoding: String.Encoding.utf8)!)
            
            let result = try? JSONDecoder().decode(Register.self, from: data)
            if let result = result {
                DispatchQueue.main.async {
                    self.owner_name = result.ownerName
                    self.name = result.staffName
                    self.owner_email = result.ownerEmail
                    self.owner_password = result.password
                }
            } else {
                DispatchQueue.main.async {
                    print("gagal me-response dari web servis")
                }
            }
        })
            task.resume()
    }
}

