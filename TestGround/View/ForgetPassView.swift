//
//  ContentView.swift
//  Macro-Proj1
//
//  Created by Fandika Ikhsan on 27/10/21.
//

import SwiftUI


let storedForgetUsername = "Myusername"
let storedForgetPassword = "Mypassword"


let buttonColor = Color(#colorLiteral(red: 0.8275076747, green: 0.8276013732, blue: 0.8274536133, alpha: 1))

struct ForgetPassView: View {
    
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
    
    @State private var formKosong: String = ""
    
    var body: some View {
        
        
        // page 1
        VStack {
            VStack {
                Text("Masukan kata sandi anda yang baru")
                    .padding(.bottom)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Kata Sandi")
                        .bold()
                    SecureField("Secure Field", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("Apple")/*@END_MENU_TOKEN@*/)
                        .overlay(RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                    
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Ulangi Kata Sandi")
                        .bold()
                    
                    SecureField(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/"Password"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("Apple")/*@END_MENU_TOKEN@*/)
                        .overlay(RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                   
                    Text("*kedua field harus sama")
                        .font(.caption)
     
                }
                
                
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Kirim")
                        .padding()
                        .frame(width: 200, height: 40, alignment: .center)
                        .background(buttonColor)
                        .foregroundColor(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    
                }
                Spacer()
                
                // baru
                ForgetPasswordSecureField(password: $password)
            
                
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
                    ForgetLoginButtonContent()
                }
                .padding()
                

            }
            .padding()
        }
        
    }
}

struct ForgetPasswordSecureField : View {
    
    @Binding var password: String
    
    var body: some View {
        return SecureField("Enter a password", text: $password)
            .padding(.top, 20)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct ForgetLoginButtonContent : View {
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


struct ForgetPassView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//struct TextFieldCustom {
//
//    @Binding var formKosong: String
//
//    var body: some View {
//        TextField("fandika", text: $formKosong)
//    }
//}
