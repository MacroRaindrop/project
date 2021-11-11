//
//  ContentView.swift
//  Macro-Raindrop
//
//  Created by Fandika Ikhsan on 05/11/21.
//

import SwiftUI

struct StockListView: View {

    @State private var query = ""

    var body: some View {
        
        
        
        NavigationView {
            List {
                ForEach(0 ..< 10) { i in
                    ZStack {
                        StockListContentView()
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(action: {}) {Image(systemName: "trash")}
                    }.tint(.red)
                    
                }
            }
            .listStyle(PlainListStyle())
            .searchable(text: $query)
            .navigationBarTitle("Stok")
            .navigationBarItems(leading:
                                    Button(action: {print("...")}) {Text("Edit")},
                                trailing:
                                    Button(action: {print("...")}) {Image(systemName: "plus")})
        }
        
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        StockListView()
    }
}
