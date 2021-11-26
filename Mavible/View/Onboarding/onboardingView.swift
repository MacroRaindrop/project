//
//  onboarding.swift
//  Mavible
//
//  Created by Agni Muhammad on 25/11/21.
//

import SwiftUI

struct onboardingView: View {
    @EnvironmentObject var appState: AppState

    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(CustomColor.raindrop1)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    var body: some View {
        ZStack {
            
            TabView {
                onboardingPage1()
                
                
                onboardingPage2()
                
                VStack(spacing: 16){
                    Image("Onboarding3")
                        .resizable()
                        .frame(width: 320, height: 320, alignment: .leading)
                    Text("Akses Info Penting dengan Cepat")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Melihat pergerakan barang dengan 1 langkah")
                        .multilineTextAlignment(.center)
                    
                    Button("Masuk") {
                        appState.hasOnboarded = true
                    }
                    .foregroundColor(.blue)
                }
                .padding()
                .foregroundColor(CustomColor.buttonFont)
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }}
    

struct onboarding_Previews: PreviewProvider {
    static var previews: some View {
        onboardingView()
    }
}


struct onboardingPage1: View {
    var body: some View {
        VStack(spacing: 16){
            Image("Onboarding1")
                .resizable()
                .frame(width: 320, height: 320, alignment: .leading)
            Text("Semua Inventory dalam Genggaman")
                .font(.title3)
                .fontWeight(.semibold)
            Text("Mengetahui status inventory anda dalam 1 aplikasi")
                .multilineTextAlignment(.center)
        }
        .padding()
        .foregroundColor(CustomColor.buttonFont)
    }
}

struct onboardingPage2: View {
    var body: some View {
        VStack(spacing: 16){
            Image("Onboarding2")
                .resizable()
                .frame(width: 320, height: 320, alignment: .leading)
            Text("Pengelolaan Inventori Terbaik")
                .font(.title3)
                .fontWeight(.semibold)
            Text("Mencatat proses masuk dan keluar barang lebih mudah dan cepat")
                .multilineTextAlignment(.center)
        }
        .padding()
        .foregroundColor(CustomColor.buttonFont)
    }
}
