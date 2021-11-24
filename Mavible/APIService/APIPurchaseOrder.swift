//
//  APIPurchaseOrder.swift
//  Mavible
//
//  Created by Rostadhi Akbar, M.Pd on 23/11/21.
//

import Foundation
import Combine
import SwiftUI
import SystemConfiguration

class PurchaseOrderService: ObservableObject {
    
    var didChange = PassthroughSubject<PurchaseOrderService, Never>()
    @Published var id_company: Int = 0
    @Published var id_staff: Int = 0
    @Published var supplier: String = ""
    @Published var date: String = ""
    @Published var products: [Products]
    
    @Published var purchaseOrders: [PurchaseOrder] = []
    
    
    @Published var theAPIReachable : Bool = true {
        didSet {
            didChange.send(self)
        }
    }
    
    
    func addPurchaseOrder(purchaseOrder: PurchaseOrder){
        guard let url = URL(string: urlPurchaseOrder) else { return }
        
        guard let finishBody = try? JSONEncoder().encode(purchaseOrders) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = finishBody
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
            
            let result = try? JSONDecoder().decode(PurchaseOrder.self, from: data)
            if let result = result {
                DispatchQueue.main.async {
                    self.id_company = result.id_company
                    
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
