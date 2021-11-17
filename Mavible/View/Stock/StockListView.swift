//
//  ContentView.swift
//  Macro-Raindrop
//
//  Created by Fandika Ikhsan on 05/11/21.
//

import SwiftUI

struct StockListView: View {
    
    @State private var query = ""
    @State var showDetailView = false
    @ObservedObject var listModel = GetProductViewModel()
    
    var body: some View {
        
        
        
        NavigationView {
            List {
                ForEach(listModel.items, id: \.id) { item in
                    ZStack {
                        StockListContentView()
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(action: {}) {Image(systemName: "trash")}
                    }
                    .tint(.red)
                }
            }
            .listStyle(PlainListStyle())
            .searchable(text: $query)
            .navigationBarTitle("Stok")
            .navigationBarItems(leading:
                                    Button(action: {print("...")}) {Text("Edit")},
                                trailing:
                                    Button(action: {
                self.showDetailView = true}) {Image(systemName: "plus")})
            NavigationLink(destination: AddDetailView(showModal: .constant(true)), isActive: $showDetailView){
                Text ("Add Detail")
            }.navigationBarBackButtonHidden(true)
        }
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        StockListView()
    }
}
