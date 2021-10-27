//
//  Register.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 27/10/21.
//

import SwiftUI

struct RegisterView: View {
    @State var username: String = ""
    @State var company: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var repeatPassword: String = ""
    
    var body: some View {
        VStack {
            Text("Daftar")
                .padding()
                .font(.system(size: 30))
            VStack {
                HStack {
                    Text("Username")
                        .font(Font.headline.weight(.bold))
                    
                    Spacer()
                }
                .padding()
                
                TextField("Input Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                HStack {
                    Text("Company")
                        .font(Font.headline.weight(.bold))
                    
                    Spacer()
                }
                .padding()
                
                TextField("Input Company", text: $company)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                HStack {
                    Text("Email")
                        .font(Font.headline.weight(.bold))
                    
                    Spacer()
                }
                .padding()
                
                TextField("Input Your Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                HStack {
                    Text("Password")
                        .font(Font.headline.weight(.bold))
                    
                    Spacer()
                }
                .padding()
                
                TextField("Input Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                HStack {
                    Text("Repeat Password")
                        .font(Font.headline.weight(.bold))
                    
                    Spacer()
                }
                .padding()
                
                TextField("Input Your Password Again", text: $repeatPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
            }
            
            VStack {
                Button(action: {
                    print("Create New User")
                }) {
                    Text("Create User")
                        .frame(maxWidth: 219, maxHeight: 20)
                        .font(.system(size: 20))
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                Spacer()
                    .frame(height: 20)
            }
            
            .padding()
            Spacer()
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
