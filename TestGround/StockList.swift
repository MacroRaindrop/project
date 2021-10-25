//
//  StockList.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 25/10/21.
//

import SwiftUI

struct StocklistView: View {
    
    
    var body: some View {
        NavigationView {
            List(0 ..< 10) { item in
                Image(systemName: "photo")
                VStack(alignment: .leading) {
                    Text("sabun")
                    Text("cuci")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                }
            }
            .navigationTitle("Stock List")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button("Save"){
                        print("save tapped")
                    }
                }
                ToolbarItemGroup(placement: .navigationBarLeading){
                    Button("Back"){
                        print("save tapped")
                    }
                }
            }
        }
        TabView {
            Text("")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Text("Home")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Text("Home")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
        }
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.device)
            .previewDevice("iPhone 12")
    }
}
