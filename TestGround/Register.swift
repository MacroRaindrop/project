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
    @State var hiddenPassword = false
    
    
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
                
                
                TextField("Input Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                HStack {
                    Text("Company")
                        .font(Font.headline.weight(.bold))
                    
                    Spacer()
                }
               
                
                TextField("Input Company", text: $company)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                HStack {
                    Text("Email")
                        .font(Font.headline.weight(.bold))
                    
                    Spacer()
                }
        
                
                
                TextField("Input Your Email", text: self.$email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                 
                    
                
                HStack {
                    Text("Password")
                        .font(Font.headline.weight(.bold))
                    
                    Spacer()
                }
                
                HStack {
                    Group {
                        
                        if self.hiddenPassword {
                            TextField("Input Password", text: self.$password)
                                .padding()
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: UIScreen.main.bounds.width - 40)
//                                .background((Color(red: 233.0/255, green: 234.0/255,blue: 243.0/255)))
                                .cornerRadius(10)
                        } else {
                            SecureField("Input Password", text:
                                            self.$password)
                                .padding()
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: UIScreen.main.bounds.width - 40)
//                                .background((Color(red: 233.0/255, green: 234.0/255,blue: 243.0/255)))
                                .cornerRadius(10)
                                
                        }
                        
                        Button(action : {
                            self.hiddenPassword.toggle()
                        }) {
                            Image(systemName: self.hiddenPassword ? "eye.fill" :
                                "eye.slash.fill")
                                .foregroundColor((self.hiddenPassword == true ) ?
                                                 Color.green : Color.secondary)
                        }.offset(x: -60, y: 0)
                    }
                }
                
                HStack {
                    Text("Repeat Password")
                        .font(Font.headline.weight(.bold))
                    
                    Spacer()
                }
                
                HStack {
                    Group {
                        
                        if self.hiddenPassword {
                            TextField("Input Password Again", text: self.$password)
                                .padding()
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: UIScreen.main.bounds.width - 40)
//                                .background((Color(red: 233.0/255, green: 234.0/255,blue: 243.0/255)))
                                .cornerRadius(10)
                        } else {
                            SecureField("Input Password Again", text:
                                            self.$password)
                                .padding()
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: UIScreen.main.bounds.width - 40)
//                                .background((Color(red: 233.0/255, green: 234.0/255,blue: 243.0/255)))
                                .cornerRadius(10)
                                
                        }
                        
                        Button(action : {
                            self.hiddenPassword.toggle()
                        }) {
                            Image(systemName: self.hiddenPassword ? "eye.fill" :
                                "eye.slash.fill")
                                .foregroundColor((self.hiddenPassword == true ) ?
                                                 Color.green : Color.secondary)
                        }.offset(x: -60, y: 0)
                    }
                }
                
                
            }
            .padding([.leading, .trailing])
            Spacer(minLength: 50)
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
        if #available(iOS 15.0, *) {
            RegisterView()
                .previewDevice("iPhone 12")
        } else {
            // Fallback on earlier versions
        }
    }
}
