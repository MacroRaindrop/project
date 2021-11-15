//
//  StockView.swift
//  Mavible
//
//  Created by Rostadhi Akbar, M.Pd on 12/11/21.
//

import SwiftUI

struct StockView: View {
    @ObservedObject var viewModel = GetProductViewModel()
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.items, id: \.id){ item in
                    VStack(alignment: .leading) {
                        Text(item.name)
                        Text(item.description)
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .onAppear(perform: {
                viewModel.getProduct()
            })
        }
        .navigationTitle("STOK")
        .navigationBarHidden(true)
    }
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView()
    }
}
