import SwiftUI



@available(iOS 15.0, *)
struct RegisterView: View {
    
    
    @ObservedObject var signupVM = SignupViewModel()
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
    @State var emailNotValid: Bool = false
    @State var passwordNull: Bool = false
    @State var repeatPasswordNull: Bool = false
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    @State var newAcc: Bool = false
    @State var isEmptyField = false
    @State var moveToLogin = false
    @StateObject var authentication = APIRegister()
    
    @State private var emailString  : String = ""
    @State private var textEmail    : String = ""
    @State private var isEmailValid : Bool   = true
    
    @Environment(\.dismiss) var dismiss
    
    //abis register langsung masuk ke login
    //jika balik ke login gk perlu navigationview
    var body: some View {
        ZStack {
            VStack {
                Text("Daftar")
                    .padding(.bottom, 40)
                    .font(.system(size: 28, weight: .bold))
                VStack {
                    HStack {
                        Text("Nama Pemilik")
                            .font(Font.headline.weight(.bold))
                        Spacer()
                    }
                    TextField("Masukkan Nama", text: self.$username)
                        .font(.system(size: 14))
                        .frame(height: 34)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal, 10)
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    HStack {
                        Text("Perusahaan")
                            .font(Font.headline.weight(.bold))
                        Spacer()
                    }
                    TextField("Masukkan Company", text: self.$company)
                        .font(.system(size: 14))
                        .frame(height: 34)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal, 10)
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    HStack {
                        Text("E-mail")
                            .font(Font.headline.weight(.bold))
                        Spacer()
                    }
                    TextField("example@gmail.com", text: $signupVM.email)
                        .font(.system(size: 14))
                        .frame(height: 34)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal, 10)
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
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
                                                self.$repeatPassword)
                                    .font(.system(size: 14))
                                    .frame(height: 34)
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .padding(.horizontal, 10)
                                    .cornerRadius(20)
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
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
                    else if emailNotValid {
                        Text("format email salah")
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
                        if signupVM.email.isEmpty{
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
                        if signupVM.validEMail == true {
                            emailNotValid = false
                        }else{
                            emailNotValid = true
                        }
                        if self.password == repeatPassword && emailNotValid == false{
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
                        //dismiss()
                    }) {
                        Text("Buat Akun")
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: 220, maxHeight: 48)
                            .font(.system(size: 20))
                            .foregroundColor(CustomColor.buttonFont)
                            .background(CustomColor.raindrop1Color)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.horizontal, 60)
                    }
                    Spacer()
                        .frame(height: 100)
                }
                .padding()
                Spacer()
            }
        }
        .navigationBarTitle("", displayMode: .inline)
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



