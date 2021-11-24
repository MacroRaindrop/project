//
//  OrderService.swift
//  Mavible
//
//  Created by Rostadhi Akbar, M.Pd on 24/11/21.
//

import Foundation
import Combine
import SwiftUI
import SystemConfiguration

class OrderService : ObservableObject {
    @Published var purchaseOrders = [Order]()
    func postOrder(order:Order){
        let parameter : [ String : Any ] = ["id_company" : 0, "id_staff" : 0, "supplier" : "string", "date" : "string", "products" : [order.products]]
        guard let url = URL(string: urlPurchaseOrder) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
            } catch {
                print("error")
            }
        })
        task.resume()
    }
}
