//
//  APIProduct.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 10/11/21.
//

import Foundation
import Combine

class APIProduct: ObservableObject {
    @Published var products: [Product] = []
    
    func addProduct() {
        guard let url = URL(string: "https://be-raindrop-app.herokuapp.com/products") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                return
            }
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                DispatchQueue.main.async {
                    self.products = products
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getProduct() {
        guard let url = URL(string: "https://be-raindrop-app.herokuapp.com/products?skip=0&limit=10") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                return
            }
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                DispatchQueue.main.async {
                    self.products = products
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    func updateProduct() {
        guard let url = URL(string: "https://be-raindrop-app.herokuapp.com/products") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                return
            }
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                DispatchQueue.main.async {
                    self.products = products
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
