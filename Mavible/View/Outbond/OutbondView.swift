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
                
                Spacer()
                
                Button(action: {print("...")}) {OutbondButtonContent(buttonColor: CustomColor.disabledButtonColor, buttonText: "Lanjut")}
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
