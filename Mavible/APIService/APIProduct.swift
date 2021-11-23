//
//  APIProduct.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 10/11/21.
//

import Foundation
import Combine

class APIProduct: ObservableObject {
    //Variabel Untuk Parameter DB
    @Published var name: String = ""
    @Published var minimum_stock: Int = 0
    @Published var image: String = ""
    @Published var unit: String = ""
    @Published var description: String = ""
    @Published var quantity: Int = 0
    
    
    
    //Array Dari Model
    @Published var products: [Product] = []
    
    //Fungsi Menambah Product Ke DB
    func addProduct(name: String,minimum_stock: String,image: String,unit: String,description: String,quantity: String) {
        
        //URL DB
        guard let url = URL(string: "https://be-raindrop-app.herokuapp.com/products") else { return }
        
        //Encoding Body
        let body : [ String : String] = ["name" : name, "minimum_stock" : minimum_stock, "image" : image, "unit" : unit, "description" : description, "quantity" : quantity]
        guard let finishBody = try? JSONEncoder().encode(body) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = finishBody
        
        //URL Session & Decode
        let task = URLSession.shared.dataTask(with: request, completionHandler:  { (data, response, error) in
            guard let data = data, error == nil else {
                print("Data Response Kosong")
                
               
                return
            }
            print(response!)
            print(String(data: data, encoding: String.Encoding.utf8)!)
            
            let result = try? JSONDecoder().decode(Product.self, from: data)
            if let result = result {
                DispatchQueue.main.async {
                    self.name = result.name
                    self.minimum_stock = result.minimum_stock
                    self.image = result.image
                    self.unit = result.unit
                    self.description = result.description
                    self.quantity = result.quantity
                }
            } else {
                DispatchQueue.main.async {
                    print("gagal me-response dari web servis")
                }
            }
        })
            task.resume()
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
                    let decodedData = try JSONDecoder().decode(Product.self, from: data)
                    DispatchQueue.main.async {
                        self.name = decodedData.name
                        self.minimum_stock = decodedData.minimum_stock
                        self.image = decodedData.image
                        self.unit = decodedData.unit
                        self.description = decodedData.description
                        self.quantity = decodedData.quantity
                    }
                } catch {
                    print(error)
                }
            }.resume()
        }
}
