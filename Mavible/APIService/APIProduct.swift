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
            let url = URL(string: "https://be-raindrop-app.herokuapp.com/products")!
            let fullURL = url.appendingPathComponent("/PUT")
    
            var request = URLRequest(url: fullURL)
            request.httpMethod = "PUT"
            request.allHTTPHeaderFields = [ "Content-Type": "application/json",
                                            "Accept": "application/json"
                                        ]
        
            let body : [ String : Any] = ["name" : name, "minimum_stock" : minimum_stock, "image" : image, "unit" : unit, "description" : description, "quantity" : quantity]
            let data = try! JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        

            URLSession.shared.uploadTask(with: request, from: data) {(responseData, response,error) in
                if let error = error {
                    print(error)
                    return
                }
                if let responseCode = (response as? HTTPURLResponse)?.statusCode, let responseData = responseData {
                        guard responseCode == 200 else {
                            print("Invalid response code: \(responseCode)")
                            return
                        }
                        
                        if let responseJSONData = try? JSONSerialization.jsonObject(with: responseData, options: .allowFragments) {
                            print("Response JSON data = \(responseJSONData)")
                        }
                    }
            }.resume()
        }
}
