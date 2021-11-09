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

    @State var isEmptyField: Bool = false
    @State var willMoveToNextScreen = false
    
    @ObservedObject var loginManager: APILogin
    
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
                        UsernameTextField(username: self.$username, editingMode: $editingMode)
                        HStack{
                            Text("Password")
                                .font(Font.headline.weight(.bold))
                                .padding()
                            
                            Spacer()
                            
                            Button("Lupa Sandi?") {
                                print("Button tapped!")
                            }
                        }
                        PasswordSecureField(password: self.$password)
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

                        NavigationLink(destination: DashboardView(), isActive: $willMoveToNextScreen){
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
                                if usernameNull == true || passwordNull == true{
                                    authenticationDidSucceed = false
                                } else {
                                    authenticationDidSucceed = true
                                }
                                if self.authenticationDidSucceed {
                                    self.loginManager.loginCheck(owner_email: self.username, owner_password: self.password)
                                    //kasih timer/delay async
                                    self.willMoveToNextScreen = self.loginManager.loggedIn
                                } else {
                                    print("gagal login")
                                }
                            }){
                                LoginButtonContent()
                            }
                        }
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
            }
            .navigationTitle(Text(""))
        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
////        LoginView()
//    }
//}

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

extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    RegisterView()
                }
            }
        }
    }
}

