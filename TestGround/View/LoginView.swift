//
//  LoginView.swift
//  TestGround
//
//  Created by Agni Muhammad on 27/10/21.
//

import SwiftUI

//let storedUsername = "Myusername"
//let storedPassword = "Mypassword"

struct LoginView: View {
    
    @StateObject var authenticate = APILogin()
    @ObservedObject var loginAuth = APILogin()
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var reminder: String = ""
    @State private var lupaSandi =  false
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    @State var usernameNull: Bool = false
    @State var passwordNull: Bool = false
    
    
    @State var editingMode: Bool = false
    @State var newAcc: Bool = false
    
    @State var isEmptyField = false


    
    var body: some View {
        
        NavigationView {
            
            ZStack {
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
                        UsernameTextField(username: $username, editingMode: $editingMode)
                        HStack{
                            Text("Password")
                                .font(Font.headline.weight(.bold))
                                .padding()
                            
                            Spacer()
                            
                            Button("Lupa Sandi?") {
                                print("Button tapped!")
                            }
                        }
                        PasswordSecureField(password: $password)
                        if usernameNull {
                            Text("email tidak boleh kosong")
                                .offset(y: -10)
                                .foregroundColor(.red)
                        }
                        else if passwordNull {
                            Text("password tidak boleh kosong")
                                .offset(y: -10)
                                .foregroundColor(.red)
                        }
                        else if authenticationDidFail {
                            Text("email atau password salah")
                                .offset(y: -10)
                                .foregroundColor(.red)
                        }
                        //TODO : Metode pindah view selain navigation link.
                        NavigationLink(destination: DashboardView()){
                            Button(action: {
                                
                                
                                if username.isEmpty{
                                    usernameNull = true
                                }else{
                                    usernameNull = false
                                }
                                if password.isEmpty{
                                    passwordNull = true
                                }else{
                                    passwordNull = false
                                }
//                                if self.username == owner_email && self.password == password {
//                                    self.authenticationDidSucceed = true
//                                } else {
//                                    self.authenticationDidFail = true
//                                    print("gagal login")
//                                }
//                                if loginAuth.loginCheck(owner_email: self.username, owner_password: self.password){
//                                    authenticationDidSucceed = true
//                                }
//                                if self.authenticationDidSucceed{
//                                    loginAuth.loginCheck(owner_email: self.username, owner_password: self.password)
//                                }else {
//                                    self.authenticationDidFail = true
//                                    print("gagal login")
//                                }
                                
                            }){
                                LoginButtonContent()
                            }
                        }
                        .padding()
                        NavigationLink(destination: RegisterView()){
                            Text("Belum Punya Akun?")
                        }
                        .padding()
                        
                        //TODO : Ganti metode dan tambah data ke DB
                        NavigationLink(destination: AddDetailView(showModal: .constant(true))){
                            Text("detail")
                        }
                        .padding()
                    }
                    .padding()
                    Spacer()
                    Text(reminder).hidden()
                }
                .padding()
                if authenticationDidSucceed {
                    Text("Login succeeded!")
                        .font(.headline)
                        .frame(width: 250, height: 80)
                        .background(Color.green)
                        .cornerRadius(20.0)
                        .foregroundColor(.white)
                    //change
                        .animation(Animation.default)
                }
            }
            .navigationTitle(Text(""))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct UsernameTextField : View {
    
    @Binding var username: String
    
    @Binding var editingMode: Bool
    
    var body: some View {
        return TextField("Type your email", text: $username, onEditingChanged: {edit in
            if edit == true
            {self.editingMode = true}
            else
            {self.editingMode = false}
        })
            .padding(.top, 20)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.none)
    }
}


struct PasswordSecureField : View {
    
    @Binding var password: String
    
    var body: some View {
        return SecureField("Enter a password", text: $password)
            .padding(.top, 20)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
            .autocapitalization(.none)
    }
}

struct LoginButtonContent : View {
    var body: some View {
        return Text("Masuk")
            .frame(maxWidth: 219, maxHeight: 20)
            .font(.system(size: 20))
            .padding()
            .foregroundColor(.black)
            .background(Color.raindropColor)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

