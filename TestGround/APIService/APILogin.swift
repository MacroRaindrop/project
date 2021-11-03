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
    @Published var passwordCorrect : Bool = true
    @Published var userName: String = ""
    @Published var loginConnected : Bool = true
    @Published var theAPIReachable : Bool = true {
        didSet {
            didChange.send(self)
        }
    }
    
    @Published var successLoggedin : Bool = false {
        didSet {
            didChange.send(self)
        }
    }
    //isi kodingan
    @Published var login: [Login] = []
    
    func loginCheck(email: String, password: String ) {

        //3 pasang url
        guard let url = URL(string: "https://be-raindrop-app.herokuapp.com/login") else {
            return
        }
        
        let body : [String : String] = ["email": email, "password": password ]
        
        guard let finalBody = try? JSONEncoder().encode(body) else {
            return
        }

        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            //4 set isApiReachable
            guard let data = data, error == nil else {
                print("No data response")
                
                DispatchQueue.main.async {
                    self.theAPIReachable = false
                }
                return
                
            }
            
            // decode data
            let result = try? JSONDecoder().decode(Login.self, from: data)
            
            if let result = result {
                DispatchQueue.main.async {
                    if(result.success){
                        self.successLoggedin = true
                        //ubah status isCorrect
                        self.passwordCorrect = true
                        self.userName = result.email
                    }else {
                        self.passwordCorrect = false
                    }
                }
                
            } else {
                DispatchQueue.main.async {
                    self.passwordCorrect = false
                    print("Invalid response from web services!")
                }
            }
            
        }.resume()
    }
    
        
}
