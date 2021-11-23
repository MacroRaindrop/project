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
                    self.items = decodedData
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
