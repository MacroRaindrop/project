//
//  PICViewModel.swift
//  Mavible
//
//  Created by Rostadhi Akbar, M.Pd on 15/11/21.
//

import Foundation
import Combine
import SwiftUI

class PICViewModel: ObservableObject {
    @Published var picCompany = [Owner]()
    func getCompanyPic () {
        guard let url = URL(string: urlCompanyPic) else { return }
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                return
            }
            do {
                let decodedData = try JSONDecoder().decode([Owner].self, from: data)
                DispatchQueue.main.async {
                    self.picCompany = decodedData
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
