//
//  DashboardView.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 02/11/21.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
            TabView() {
                SummaryView()
                    .tabItem {
                        Image(systemName: "chart.bar.xaxis")
                        Text("Ringkasan")
                    }
//                StokView(text: .constant(""))
                StockListView()
                    .tabItem {
                        Image(systemName: "shippingbox")
                        Text("Stok")
                    }
                UpdateView()
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
            .accentColor(CustomColor.raindropColor)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
