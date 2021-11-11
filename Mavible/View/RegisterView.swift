import SwiftUI



@available(iOS 15.0, *)
struct RegisterView: View {
    
    
    
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
    @State var isEmptyField = false
    @State var moveToLogin = false
    @StateObject var authentication = APIRegister()
    
    @Environment(\.dismiss) var dismiss
    
    //abis register langsung masuk ke login
    //jika balik ke login gk perlu navigationview
    var body: some View {
        ZStack {
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
                TextField("Masukkan Nama", text: self.$username)
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
                TextField("Masukkan Company", text: self.$company)
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
                                        .cornerRadius(10)
                                        .keyboardType(.default)
                                        .autocapitalization(.none)
                            } else {
                                SecureField("Masukkan Kata Sandi", text:
                                                            self.$password)
                                        .padding()
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .frame(width: UIScreen.main.bounds.width - 10)
                                        .cornerRadius(10)
                                        .keyboardType(.default)
                                        .autocapitalization(.none)
                                    }
                            Button(action : {
                                self.hiddenPassword.toggle()
                            }) {
                                Image(systemName: self.hiddenPassword ? "eye.fill" : "eye.slash.fill")
                                    .foregroundColor((self.hiddenPassword == true ) ? Color.green : Color.secondary)
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
                                .cornerRadius(10)
                                .keyboardType(.default)
                                .autocapitalization(.none)
                        } else {
                            SecureField("Masukkan Kata Sandi", text:
                                            self.$repeatPassword)
                                .padding()
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: UIScreen.main.bounds.width - 10)
                                .cornerRadius(10)
                                .keyboardType(.default)
                                .autocapitalization(.none)
                        }
                        Button(action : {
                            self.hiddenRepeatPassword.toggle()
                        }) {
                            Image(systemName: self.hiddenRepeatPassword ? "eye.fill" : "eye.slash.fill")
                                .foregroundColor((self.hiddenRepeatPassword == true ) ? Color.green : Color.secondary)
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
                    } else if companyNull {
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
                        if self.authenticationDidSucceed {
                            self.authentication.registerCheck(owner_name: self.username, name: self.company, owner_email: self.email, owner_password: self.password)
                            
                        } else {
                            print("register gagal")
                        }
                        dismiss()
                    }) {
                        Text("Create User")
                            .frame(maxWidth: 219, maxHeight: 20)
                            .font(.system(size: 20))
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.raindropColor)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding()
                    }
                    Spacer()
                        .frame(height: 100)
                }
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
    static let raindrop1Color = Color("raindrop1")
    static let discontinueColor = Color("Discontinue")
    static let disabledButtonColor = Color("DisabledButton")
    static let lowColor = Color("LowStock")
    static let noStockColor = Color("NoStock")
    static let secondaryButtonColor = Color("SecondaryButton")
}
