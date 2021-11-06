//
//  ContentView.swift
//  TestGround
//
//  Created by Gerald Stephanus on 21/10/21.
//

import SwiftUI

struct ContentView: View {
    //Membuat Flow Maju Mundur Untuk Login-Register-ForgotPassword
    @State var isLoggedIn: Bool = false
    var body: some View {
        if !isLoggedIn {
            LoginView()
        } else {
            RegisterView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
        }
    }
