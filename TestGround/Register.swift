//
//  Register.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 27/10/21.
//

import SwiftUI

struct RegisterView: View {
    @State var username: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Profile")) {
                        TextField("FirstName", text: $username)
                        TextField("LastName", text: $username)
                    }
                    Section(header: Text("Perusahaan")) {
                        TextField("", text: $username)
                    }
                    Section(header: Text("Email")) {
                        TextField("", text: $username)
                    }
                    Section(header: Text("Kata Sandi")) {
                        TextField("*******", text: $username)
                        
                    }
                    Section(header: Text("Ulangi Kata Sandi")) {
                        TextField("*******", text: $username)
                    }
                    Section{
                        Button (action: {
                            print("Perform an action here...")
                        }){
                            Text("Buat Akun")
                        }
                        .frame(height: 55)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.purple)
                        .buttonStyle(PlainButtonStyle())
                        .cornerRadius(10)
                        .foregroundColor(.black)
                    }
                }
            }
            .navigationBarTitle("Register")
            
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
