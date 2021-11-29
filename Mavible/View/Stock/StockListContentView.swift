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
    @State var captionText: String = "Lorem ipsum dolor sit amet aksldjf lkavjoiwen"
    @State var qtyText: Int = 1
    @State var satuanText: String = "Satuan"

    
    var body: some View {
        HStack {
            Image(imageList)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70, alignment: .leading)
            
            VStack (alignment: .leading, spacing: 2) {
                Text(titleText)
                    .font(.title)
                Divider()
                Text(captionText)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            VStack {
                Text(String(qtyText))
                    .font(.largeTitle)
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
