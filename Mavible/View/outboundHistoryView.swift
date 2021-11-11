//
//  outboundHistoryView.swift
//  TestGround
//
//  Created by Agni Muhammad on 10/11/21.
//

import SwiftUI


struct outboundHistoryView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text(date, style: .date)
            
            HStack {
                VStack (alignment: .leading) {
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Jagung Rebus")
                            Text("-")
                        }
                        
                        Spacer()
                        
                        Text("-26")
                            .font(.title)
                            .multilineTextAlignment(.center)
                    }
                    
                    
                    
                    HStack {
                        Text("PIC: ")
                        
                        Text("Budi Goks")
                            .font(.body).italic()
                        
                        Spacer()
                        
                        Text("stok")
                        
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.raindropColor, lineWidth: 3)
                )
                
            }
        }
        //        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
}


struct outboundHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        outboundHistoryView()
    }
}
