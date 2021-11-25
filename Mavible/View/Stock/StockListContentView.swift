//
//  ContentListView.swift
//  Macro-Raindrop
//
//  Created by Fandika Ikhsan on 05/11/21.
//

import SwiftUI

struct StockListContentView: View {
    
    // Data for each list.
    
    // 1. Image
    // 2. Overlay stroke color
    // 3. Text Title
    // 4. Text Caption
    // 5. Text Qty
    // 6. Text Satuan
    
    @State var imageList: String = "POicon"
    @State var strokeColor: Color = .yellow
    @State var titleText: String = "This is title"
    @State var captionText: String = "This is caption This is Captiopn This is Caption"
    @State var qtyText: Int = 1
    @State var satuanText: String = "Satuan"
    
    @State var stockCondition: String = "Low Stock"
    @State var stockConditionColor: Color = .yellow
    
    switch 
    
//    var id: Int
//    var created_at: String
//    var id_company: Int
//    var name: String
//    var minimum_stock: Int
//    var image: String
//    var unit: String
//    var description: String
//    var quantity: Int

    
    
    var body: some View {
        HStack {
            Image(imageList)
                .resizable()
                .scaledToFit()
                .frame(height: 40, alignment: .leading)
            
            VStack (alignment: .leading, spacing: 2) {
                Text(titleText)
                    .font(.title2)
                    .bold()
                    .lineLimit(1)
                    
                Divider()
                    .padding(.bottom, 3)
//                Text(captionText)
//                    .font(.caption)
//                    .foregroundColor(.secondary)
//                    .lineLimit(2)
                Text(stockCondition)
                    .frame(width: 100, height: 25)
                    .background(.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 10 ))
                    
            }
            
            VStack {
                Text(String(qtyText))
                    .font(.title)
                Text(satuanText)
            }
            
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(strokeColor, lineWidth: 1)
        )

    }
    
}

struct ContentListView_Previews: PreviewProvider {
    static var previews: some View {
        StockListContentView()
    }
}
