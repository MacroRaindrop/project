//
//  GetProductViewModel.swift
//  Mavible
//
//  Created by Rostadhi Akbar, M.Pd on 12/11/21.
//

import Foundation
class GetProductViewModel: ObservableObject {
    @Published var items = [GetProduct]()
    func getProduct() {
        guard let url = URL(string: "https://be-raindrop-app.herokuapp.com/products?skip=0&limit=10") else { return }
//            let body : [ String : String] = ["name" : name, "minimum_stock" : minimum_stock, "image" : image, "unit" : unit, "description" : description, "quantity" : quantity]
//            guard let finishBody = try? JSONEncoder().encode(body) else { return }
//

//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
//            request.httpBody = finishBody

        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                return
            }
            do {
                let decodedData = try JSONDecoder().decode([GetProduct].self, from: data)
                DispatchQueue.main.async {
//                        self.name = decodedData.name
//                        self.minimum_stock = decodedData.minimum_stock
//                        self.image = decodedData.image
//                        self.unit = decodedData.unit
//                        self.description = decodedData.description
//                        self.quantity = decodedData.quantity
                    self.items = decodedData
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
