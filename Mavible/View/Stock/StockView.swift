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
                List{
                    ForEach(viewModel.items, id: \.id){ item in
                        VStack(alignment: .leading) {
                            Text(item.name)
                            Text(item.description)
                        }
                    }
                    //tambah func untuk delete, tapi mesti nambah model "remove" dulu
                    .onDelete(perform: { (indexSet) in
                        DispatchQueue.main.async {
                            viewModel.removeItem(for: UUID())
                        }
                    })
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




