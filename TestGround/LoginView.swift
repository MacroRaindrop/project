//
//  LoginView.swift
//  TestGround
//
//  Created by Agni Muhammad on 27/10/21.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var lupaSandi =  false

    var body: some View {
        VStack{
                Text("Masuk")
                    .padding()
                    .font(.system(size: 34))
            VStack{
                HStack{
                    Text("Email")
                            .font(Font.headline.weight(.bold))
                    
                    Spacer()
 
                }
                
                .padding()
                            
                TextField("Type your email", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                
                HStack{
                    Text("Password")
                        .font(Font.headline.weight(.bold))
                        .padding()
                    
                    Spacer()
                    
                    Button("Lupa Sandi?") {
                        print("Button tapped!")
                    }
                    
                }

                SecureField("Enter a password", text: $password) .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            
              VStack {
                  Button(action: {
                         print("sign up bin tapped")
                     }) {
                         Text("Masuk")
                             .frame(maxWidth: 219, maxHeight: 20)
                             .font(.system(size: 20))
                             .padding()
                             .foregroundColor(.black)
                             .background(Color.green)
                             .clipShape(RoundedRectangle(cornerRadius: 20))
                     }
                     
                        
                     
                  Spacer()
                      .frame(height: 20)
                    
                  Button("Belum punya akun?"){
                        print("daftar")
                    }
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
