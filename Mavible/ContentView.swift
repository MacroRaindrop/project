//
//  ContentView.swift
//  TestGround
//
//  Created by Gerald Stephanus on 21/10/21.
//

import SwiftUI

struct ContentView: View {
    //Membuat Flow Maju Mundur Untuk Login-Register-ForgotPassword
    @StateObject var loginManager = APILogin()
    var body: some View {
        if loginManager.loggedIn{
            LoginView(loginManager:loginManager)
        } else {
            if #available(iOS 15.0, *) {
                RegisterView()
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
        }
    }
