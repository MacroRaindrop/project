//
//  InboundViewModel.swift
//  Mavible
//
//  Created by Rostadhi Akbar, M.Pd on 25/11/21.
//

import Foundation
import Combine
import SwiftUI
import SystemConfiguration
class InboundViewModel: ObservableObject {
    
    var didChange = PassthroughSubject<InboundViewModel, Never>()
    
    @Published var id_company: Int = 0
    @Published var id_purchaseorder: Int = 0
    @Published var item: [Products] = []
    @Published var inBound: [InBound] = []
    
    @Published var theAPIReachable : Bool = true {
        didSet {
            didChange.send(self)
        }
    }
    
    func postInbound(inbound: InBound) {
        guard let url = URL(string: urlInbound) else { return }
        
        guard let finalBody = try? JSONEncoder().encode(inbound) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = finalBody
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else {
                print("Data Response Kosong")
                DispatchQueue.main.async {
                    self.theAPIReachable = false
                }
                return
            }
            print(response!)
            print(String(data: data, encoding: String.Encoding.utf8)!)
            
            let result = try? JSONDecoder().decode(InBound.self, from: data)
            if let result = result {
                DispatchQueue.main.async {
                    self.id_company = result.id_company
                    self.id_purchaseorder = result.id_purchaseorder
                    self.item = result.items
                }
            } else {
                DispatchQueue.main.async {
                    print("Gagal")
                }
            }
        })
        task.resume()
    }
}
