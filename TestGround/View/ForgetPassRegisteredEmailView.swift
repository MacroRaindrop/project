//
//  ForgetPassFormView.swift
//  TestGround
//
//  Created by Fandika Ikhsan on 04/11/21.
//

import SwiftUI

struct ForgetPassRegisteredEmailView: View {
    
    @State private var formKosong: String = ""
    
    var body: some View {
        
        // page 2
        VStack {

            Button {
                print("Edit button was tapped")
            } label: {
                Image(systemName: "pencil")
            }

            Text("Lupa Sandi")
                .font(.title)
                .bold()

            VStack(alignment: .leading, spacing: nil) {
                Text("Email terdaftar")
                    .bold()
                TextField("", text: $formKosong)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                                .strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                Text("Link setel ulang sandi akan dikirimkan ke anda")
                    .font(.caption)
            }
            .padding()

            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Kirim")
                    .frame(width: 200, height: 40, alignment: .center)
                    .background(buttonColor)
                    .foregroundColor(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))


            })
            Spacer()
        }
        .padding(.top)

    }
}

struct ForgetPassFormView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPassRegisteredEmailView()
    }
}
