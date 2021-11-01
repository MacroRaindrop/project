//
//  LoginView.swift
//  TestGround
//
//  Created by Agni Muhammad on 27/10/21.
//

import SwiftUI

let storedUsername = "Myusername"
let storedPassword = "Mypassword"

struct LoginView: View {
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
    
//    if username == NULL (){
//        reminder.values = test
//    }

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
                            if self.username == storedUsername && self.password == storedPassword {
                                self.authenticationDidSucceed = true
                                self.authenticationDidFail = false
                            } else {
                                self.authenticationDidFail = true
                            }
                        }){
                            LoginButtonContent()
                        }
                        .padding()
        //                Button("Belum punya akun?"){
        //                      print("daftar")
        //                    self.newAcc = true
        //                }.sheet(isPresented: $newAcc, content: {
        //                    RegisterView()
        //                })
                        NavigationLink(destination: RegisterView()){
                            Text("Belum Punya Akun?")
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
   // .offset(y: editingMode ? -150 : 0)
        
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
    }
}


struct PasswordSecureField : View {
    
    @Binding var password: String
    
    var body: some View {
        return SecureField("Enter a password", text: $password)
            .padding(.top, 20)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct LoginButtonContent : View {
    var body: some View {
        return Text("Masuk")
            .frame(maxWidth: 219, maxHeight: 20)
            .font(.system(size: 20))
            .padding()
            .foregroundColor(.black)
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
