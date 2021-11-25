//
//  OutbondView.swift
//  Macro-Raindrop
//
//  Created by Fandika Ikhsan on 08/11/21.
//

import SwiftUI

struct OutbondView: View {
    
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text("ID")
                    .bold()
                UserField(userFieldCutWidth: 40)
                
                Text("PIC")
                    .bold()
                UserField(userFieldCutWidth: 40)
                
                Picker(selection: .constant("pilih PIC"), label: Text("Picker")) {
                    Text("supplier1").tag(1)
                    Text("supplier2").tag(2)
                    Text("supplier3").tag(3)
                        .frame(width: UIScreen.main.bounds.width - 40)
                }
                
                Spacer()
                
                Button(action: {print("...")}) {OutbondButtonContent(buttonColor: .secondary, buttonText: "Lanjut")}
            }
            .navigationTitle("Outbond")
            .navigationBarItems(leading:
                                    Button(action: {print("...")}) {Image(systemName: "chevron.left")})
            
 
        }
        
        
    }
}

struct OutbondView_Previews: PreviewProvider {
    static var previews: some View {
        OutbondView()
    }
}
