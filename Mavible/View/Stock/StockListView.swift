//
//  ContentView.swift
//  Macro-Raindrop
//
//  Created by Fandika Ikhsan on 05/11/21.
//

import SwiftUI

struct StockListView: View {
    
    @State var imageList: String = "beras-asset"
    @State var strokeColor: Color = .raindropColor
    
    @State private var query = ""
    @State var showDetailView = false
    @ObservedObject var listModel = GetProductViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(listModel.items, id: \.id) { item in
                    ZStack {
                        HStack {
                            Image(imageList)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 70, alignment: .leading)
                            
                            VStack (alignment: .leading, spacing: 2) {
                                Text(item.name)
                                    .font(.title)
                                Divider()
                                Text(item.description)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .lineLimit(2)
                            }
                            
                            VStack {
                                Text(String(item.quantity))
                                    .font(.largeTitle)
                                Text(item.unit)
                            }
                            
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(strokeColor, lineWidth: 1)
                        )
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(action: {}) {Image(systemName: "trash")}
                    }
                    .tint(.red)
                }
                .onDelete(perform: { (indexSet) in
                    DispatchQueue.main.async {
                        listModel.removeItem(for: UUID())
                    }
                })
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
            }
            .onAppear(perform: {
                listModel.getProduct()
            })
            .navigationBarBackButtonHidden(true)
        }
    }
}



struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        StockListView()
    }
}