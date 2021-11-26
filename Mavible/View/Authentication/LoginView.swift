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
    @State private var hasTimeElapsed = false
    @State private var isLoading = false
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var reminder: String = ""
    @State private var lupaSandi =  false
    @State var hiddenPassword = false
    
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
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("ButtonFont"))
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    VStack(alignment: .leading, spacing: 0){
                        HStack{
                            Text("E-mail")
                                .font(Font.headline.weight(.bold))
                                .padding(.bottom, 10.0)
                        }
                        UsernameTextField(username: self.$username, editingMode: $editingMode)
                        HStack{
                            Text("Kata Sandi")
                                .font(Font.headline.weight(.bold))
                            
                            Button("Lupa Sandi?") {
                                print("Button tapped!")
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color("Accent")/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.top, 50)
                        .padding(.bottom, 10.0)
                        
                        ZStack {
                            Group{
                                if self.hiddenPassword {
                                    TextField("Masukkan Kata Sandi", text: self.$password)
                                        .font(.system(size: 14))
                                        .frame(height: 34)
                                        .textFieldStyle(PlainTextFieldStyle())
                                        .padding(.horizontal, 10)
                                        .cornerRadius(20)
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .autocapitalization(.none)
                                    
                                    
                                    
                                } else {
                                    SecureField("Masukkan Kata Sandi", text:
                                                    self.$password)
                                        .font(.system(size: 14))
                                        .frame(height: 34)
                                        .textFieldStyle(PlainTextFieldStyle())
                                        .padding(.horizontal, 10)
                                        .cornerRadius(20)
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .autocapitalization(.none)
                                    
                                }
                                
                                if usernameNull {
                                    Text("email tidak boleh kosong")
                                        .offset(y: 40)
                                        .foregroundColor(.red)
                                }
                                else if passwordNull {
                                    Text("password tidak boleh kosong")
                                        .offset(y: 40)
                                        .foregroundColor(.red)
                                }
                                if authenticationDidFail {
                                    Text("email atau password salah")
                                        .offset(y: 40)
                                        .foregroundColor(.red)
                                }
                                
                                
                                Button(action : {
                                    self.hiddenPassword.toggle()
                                }) {
                                    Image(systemName: self.hiddenPassword ? "eye.fill" : "eye.slash.fill")
                                        .foregroundColor((self.hiddenPassword == true ) ? Color.green : Color.secondary)
                                }
                                .offset(x: 140, y: 0)
                            }
                            .padding(.bottom, 50)
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
                                    isLoading = true
                                    self.loginManager.loginCheck(owner_email: self.username, owner_password: self.password, completion: { status in
                                        if status == true{
                                            authenticationDidFail = false
                                            self.willMoveToNextScreen = self.loginManager.loggedIn
                                            isLoading = false
                                        }else{
                                            authenticationDidFail = true
                                            isLoading = false
                                            
                                        }
                                    })
                                  
                                    
                                }
                            }){
                                LoginButtonContent()
                            }
                             
                        }
                        if #available(iOS 15.0, *) {
                            NavigationLink(destination: RegisterView()){
                                Text("Belum Punya Akun?")
                                    .foregroundColor(Color("Accent"))
                            }
                            .padding(.top, 16.0)
                            .padding(.leading, 90)
                        } else {
                            // Fallback on earlier versions
                        }
                        
                        //TODO : Ganti metode dan tambah data ke DB
                        //                        NavigationLink(destination: AddDetailView(showModal: .constant(true))){
                        //                            Text("detail")
                        //                        }
                        //                        .padding()
                    }
                    .padding()
                    Spacer()
                    Text(reminder).hidden()
                }
                .padding()
                
                if isLoading{
                    loadingVIew()
                }
                
            }
            .navigationTitle(Text(""))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .accentColor(CustomColor.buttonFont)
        
            
        
        
            //.onAppear{ delay() }
    }
    func delay(){
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            isLoading = false
        }
    }
     func delayText() async {
            // Delay of 7.5 seconds (1 second = 1_000_000_000 nanoseconds)
         DispatchQueue.main.asyncAfter(deadline: .now() + 7.5) {
                     hasTimeElapsed = true
                 }
        }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}

struct UsernameTextField : View {
    
    @Binding var username: String
    
    @Binding var editingMode: Bool
    
    var body: some View {
        return TextField("Masukkan Email Anda", text: $username, onEditingChanged: {edit in
            if edit == true
            {self.editingMode = true}
            else
            {self.editingMode = false}
        })
            .font(.system(size: 14))
            .frame(height: 34)
            .textFieldStyle(PlainTextFieldStyle())
            .padding(.horizontal, 10)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
            .autocapitalization(.none)
    }
}


struct PasswordSecureField : View {
    
    @Binding var password: String
    
    var body: some View {
        return SecureField("Enter a password", text: $password)
            .font(.system(size: 14))
            .frame(height: 34)
            .textFieldStyle(PlainTextFieldStyle())
            .padding(.horizontal, 10)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
            .padding(.bottom, 50)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.none)
    }
}

struct LoginButtonContent : View {
    var body: some View {
        return Text("Masuk")
            .multilineTextAlignment(.center)
            .frame(maxWidth: 220, maxHeight: 48)
            .font(.system(size: 20))
            .foregroundColor(CustomColor.buttonFont)
            .background(CustomColor.raindrop1Color)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, 60)
        
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
                    if #available(iOS 15.0, *) {
                        RegisterView()
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }
        }
    }
}

