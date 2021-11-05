//
//  DashboardView.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 02/11/21.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        TabView {
            Text("Another Tab")
                .tabItem {
                    Image(systemName: "chart.bar.xaxis")
                    Text("Ringkasan")
                }
            StokView(text: .constant(""))
                .tabItem {
                    Image(systemName: "shippingbox")
                    Text("Stok")
                }
            Text("The Last Tab")
                .tabItem {
                    Image(systemName: "arrow.left.arrow.right")
                    Text("Pesanan")
                }
            Text("The Last Tab")
                .tabItem {
                    Image(systemName: "book")
                    Text("Riwayat")
                }
        }
        .font(.headline)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
