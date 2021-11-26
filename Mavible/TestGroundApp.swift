//
//  TestGroundApp.swift
//  TestGround
//
//  Created by Gerald Stephanus on 21/10/21.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var hasOnboarded: Bool
    
    init(hasOnboarded: Bool) {
        self.hasOnboarded = hasOnboarded
    }
}

@main
struct TestGroundApp: App {
    @ObservedObject var appState = AppState(hasOnboarded: false)
    @StateObject var loginManager = APILogin()
    var body: some Scene {
        WindowGroup {
            //TODO : Routing Root View
            
            if appState.hasOnboarded{
                DashboardView()
                    .environmentObject(appState)
            } else {
                onboardingView()
                    .environmentObject(appState)
            }
            //            LoginView(loginManager: loginManager)
            //                .environmentObject(appState)
            //            inboundBerhasilView()
        }
    }
}
