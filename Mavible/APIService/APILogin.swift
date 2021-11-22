//
//  APILogin.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 02/11/21.
//

import Foundation
import Combine
import SwiftUI
import SystemConfiguration

class APILogin: ObservableObject{
    
    var didChange = PassthroughSubject<APILogin, Never>()

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loggedIn = false
    @Published var theAPIReachable : Bool = true {
        didSet {
            didChange.send(self)
        }
    }
    
    
    //isi kodingan
    @Published var logins: [Register] = []
    
    func loginCheck(owner_email: String, owner_password: String ){

        // pasang url
        guard let url = URL(string: urlLogin) else {
            return
        }
        
        let body : [ String : String] = ["owner_email" : owner_email, "owner_password" : owner_password]
        
        guard let finalBody = try? JSONEncoder().encode(body) else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = finalBody
        
        URLSession.shared.dataTask(with: request) { [self] (data, response, error) in
            
            //4 set isApiReachable
            guard let data = data, error == nil else {
                print("No data response")
                
                DispatchQueue.main.async {
                    self.theAPIReachable = false
                }
                return
                
            }
            print(response!)
            print(String(data: data, encoding: String.Encoding.utf8)!)
            
            // decode data
            let result = try? JSONDecoder().decode(Register.self, from: data)
            
            if let result = result {
                DispatchQueue.main.async {
                    self.email = result.ownerEmail
                    self.password = result.password
                    self.loggedIn = true
                }
                
            } else {
                DispatchQueue.main.async {
                   
                    print("Invalid response from web services!")
                    self.loggedIn = false
                }
                
            }
            
        
            
        }.resume()
    }
}
