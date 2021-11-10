//
//  inboundHistoryView.swift
//  TestGround
//
//  Created by Agni Muhammad on 10/11/21.
//

import SwiftUI

let now = Date() // Dec 6, 2020 at 2:51 PM
let twoDays: TimeInterval = 2 * 24 * 60 * 60
let date = now.advanced(by: twoDays) // Dec 8, 2020 at 2:51 PM

struct inboundHistoryView: View {
    
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
                        
                        Text("+26")
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
        .listStyle(PlainListStyle())
        
        
        
    }
}

//        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

struct inboundHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        inboundHistoryView()
    }
}
