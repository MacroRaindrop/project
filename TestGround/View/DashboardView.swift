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
            SummaryView()
                .tabItem {
                    Image(systemName: "chart.bar.xaxis")
                    Text("Ringkasan")
                }
            StokView(text: .constant(""))
                .tabItem {
                    Image(systemName: "shippingbox")
                    Text("Stok")
                }
            PurchaseOrderView()
                .tabItem {
                    Image(systemName: "arrow.left.arrow.right")
                    Text("Pesanan")
                }
            HistoryView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Riwayat")
                }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
