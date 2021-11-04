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
            if #available(iOS 15.0, *) {
                Text("The First Tab")
                    .badge(10)
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("First")
                    }
            } else {
                // Fallback on earlier versions
            }
            Text("Another Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            Text("The Last Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
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
