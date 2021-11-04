import SwiftUI



struct RegisterView: View {
    
    @EnvironmentObject var userAuth: APIRegister
    
    @State var username: String = ""
    @State var company: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var repeatPassword: String = ""
    @State var hiddenPassword = false
    @State var hiddenRepeatPassword = false
    
    @State var usernameNull: Bool = false
    @State var companyNull: Bool = false
    @State var emailNull: Bool = false
    @State var passwordNull: Bool = false
    @State var repeatPasswordNull: Bool = false
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    @State var newAcc: Bool = false
    @State var isEmptyField: Bool = false
    @StateObject var authentication = APIRegister()
    
    var body: some View {
        
            ZStack {
                //            LinearGradient(gradient: Gradient(colors: [Color("Accent"),
                //                                                       Color("Accent")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all, edges: .all)
                            VStack {
                                
                                Text("Daftar")
                                    .padding()
                                    .font(.system(size: 30, weight: .bold))
                                    
                                VStack {
                                    HStack {
                                        Text("Nama Pemilik")
                                            .font(Font.headline.weight(.bold))
                                            
                                        
                                        Spacer()
                                    }
                                    
                                    
                                    TextField("Masukkan Nama", text: $username)
                                        .frame(width: UIScreen.main.bounds.width - 40)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding()
                                        .keyboardType(.default)
                                        .autocapitalization(.none)
                                    
                                    HStack {
                                        Text("Perusahaan")
                                            .font(Font.headline.weight(.bold))
                                        
                                        Spacer()
                                    }
                                   
                                    
                                    TextField("Masukkan Company", text: $company)
                                        .frame(width: UIScreen.main.bounds.width - 40)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding()
                                        .keyboardType(.default)
                                        .autocapitalization(.none)
                                    
                                    HStack {
                                        Text("Email")
                                            .font(Font.headline.weight(.bold))
                                        
                                        Spacer()
                                    }
                            
                                    
                                    
                                    TextField("example@gmail.com", text: self.$email)
                                        .frame(width: UIScreen.main.bounds.width - 40)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding()
                                        .keyboardType(.default)
                                        .autocapitalization(.none)
                                     
                                        
                                    
                                    HStack {
                                        Text("Kata Sandi")
                                            .font(Font.headline.weight(.bold))
                                        
                                        Spacer()
                                    }
                                    
                                    ZStack {
                                        Group {
                                            
                                            if self.hiddenPassword {
                                                TextField("Masukkan Kata Sandi", text: self.$password)
                                                    .padding()
                                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                                    .frame(width: UIScreen.main.bounds.width - 10)
                    //                                .background((Color(red: 233.0/255, green: 234.0/255,blue: 243.0/255)))
                                                    .cornerRadius(10)
                                                    .keyboardType(.default)
                                                    .autocapitalization(.none)
                                            } else {
                                                SecureField("Masukkan Kata Sandi", text:
                                                                self.$password)
                                                    .padding()
                                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                                    .frame(width: UIScreen.main.bounds.width - 10)
                    //                                .background((Color(red: 233.0/255, green: 234.0/255,blue: 243.0/255)))
                                                    .cornerRadius(10)
                                                    .keyboardType(.default)
                                                    .autocapitalization(.none)
                                                    
                                            }
                                            
                                            Button(action : {
                                                self.hiddenPassword.toggle()
                                            }) {
                                                Image(systemName: self.hiddenPassword ? "eye.fill" :
                                                    "eye.slash.fill")
                                                    .foregroundColor((self.hiddenPassword == true ) ?
                                                                     Color.green : Color.secondary)
                                            }.offset(x: 150, y: 0)
                                        }
                                    }
                                    
                                    HStack {
                                        Text("Ulangi Kata Sandi")
                                            .font(Font.headline.weight(.bold))
                                        
                                        Spacer()
                                    }
                                    
                                    ZStack {
                                        Group {
                                            
                                            if self.hiddenRepeatPassword {
                                                TextField("Masukkan Kata Sandi", text: self.$repeatPassword)
                                                    .padding()
                                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                                    .frame(width: UIScreen.main.bounds.width - 10)
                    //                                .background((Color(red: 233.0/255, green: 234.0/255,blue: 243.0/255)))
                                                    .cornerRadius(10)
                                                    .keyboardType(.default)
                                                    .autocapitalization(.none)
                                            } else {
                                                SecureField("Masukkan Kata Sandi", text:
                                                                self.$repeatPassword)
                                                    .padding()
                                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                                    .frame(width: UIScreen.main.bounds.width - 10)
                    //                                .background((Color(red: 233.0/255, green: 234.0/255,blue: 243.0/255)))
                                                    .cornerRadius(10)
                                                    .keyboardType(.default)
                                                    .autocapitalization(.none)
                                                    
                                            }
                                            
                                            
                                            Button(action : {
                                                self.hiddenRepeatPassword.toggle()
                                            }) {
                                                Image(systemName: self.hiddenRepeatPassword ? "eye.fill" :
                                                    "eye.slash.fill")
                                                    .foregroundColor((self.hiddenRepeatPassword == true ) ?
                                                                     Color.green : Color.secondary)
                                            } .offset(x: 150, y: 0)
                                        }
                                    }
                                    
                                    
                                }
                                .padding([.leading, .trailing])
                                Spacer(minLength: 20)
                                VStack {
                                    if usernameNull {
                                        Text("username tidak boleh kosong")
                                            .offset(y: -10)
                                            .foregroundColor(.red)
                                            .padding()
                                    }
                                    else if companyNull {
                                        Text("company tidak boleh kosong")
                                            .offset(y: -10)
                                            .foregroundColor(.red)
                                            .padding()
                                    }
                                    else if emailNull {
                                        Text("email tidak boleh kosong")
                                            .offset(y: -10)
                                            .foregroundColor(.red)
                                            .padding()
                                    }
                                    else if passwordNull {
                                        Text("password tidak boleh kosong")
                                            .offset(y: -10)
                                            .foregroundColor(.red)
                                            .padding()
                                    }
                                    else if repeatPasswordNull {
                                        Text("password harus diulang")
                                            .offset(y: -10)
                                            .foregroundColor(.red)
                                            .padding()
                                    }
                                    else if authenticationDidFail {
                                        Text("password tidak sama. Coba lagi")
                                            .offset(y: -10)
                                            .foregroundColor(.red)
                                            .padding()
                                    }
                                    Button(action: {
                                        if(self.username.isEmpty || self.password.isEmpty) {
                                            self.isEmptyField = true
                                        }else{
                                            self.authentication.registerCheck(owner_name: self.username, name: self.company, owner_email: self.email, owner_password: self.password)
                                        }
                                        if username.isEmpty{
                                            usernameNull = true
                                        }else{
                                            usernameNull = false
                                        }
                                        if company.isEmpty{
                                            companyNull = true
                                        }else{
                                            companyNull = false
                                        }
                                        if email.isEmpty{
                                            emailNull = true
                                        }else{
                                            emailNull = false
                                        }
                                        if password.isEmpty{
                                            passwordNull = true
                                        }else{
                                            passwordNull = false
                                        }
                                        if repeatPassword.isEmpty{
                                            repeatPasswordNull = true
                                        }else{
                                            repeatPasswordNull = false
                                        }
                                        if self.password == repeatPassword {
                                            self.authenticationDidSucceed = true
                                            self.authenticationDidFail = false
                                        } else {
                                            self.authenticationDidFail = true
                                        }
                                        print("Create New User")
                                        
                                    }){
                                        Text("Create User")
                                            .frame(maxWidth: 219, maxHeight: 20)
                                            .font(.system(size: 20))
                                            .padding()
                                            .foregroundColor(.black)
                                            .background(Color.raindropColor)
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                            .padding()
                                        
                                    }
                                    if !authentication.successLoggedin{
                                        AnyView(LoginView())
                                    }else {
                                        AnyView(DashboardView().animation(.easeIn))
                                    }
                                    Spacer()
                                        .frame(height: 100)
                                }
                                .environmentObject(authentication)
                                .padding()
                                Spacer()
                            }
                        }
        }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            RegisterView()
                .previewDevice("iPhone 12")
        } else {
            // Fallback on earlier versions
        }
    }
}

extension Color {
    static let raindropColor = Color("Accent")
}
