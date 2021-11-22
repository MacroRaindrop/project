//
//  TestGroundApp.swift
//  TestGround
//
//  Created by Gerald Stephanus on 21/10/21.
//

import SwiftUI

@main
struct TestGroundApp: App {
    @StateObject var loginManager = APILogin()
    var body: some Scene {
        WindowGroup {
            SummaryView()
//            LoginView(loginManager: loginManager)
//            inboundBerhasilView()
        }
    }
}
