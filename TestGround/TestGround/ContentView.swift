//
//  ContentView.swift
//  TestGround
//
//  Created by Gerald Stephanus on 21/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            Rectangle()
                .padding()
                .background(Color.red)
                .frame(width: 200, height: 180)
            
            VStack{
                Text("Hello, world!")
                    .padding()
                    .background(Color.red)
                Text("Hello, world!")
                    .padding()
                    .background(Color.red)
                Text("Hello, world!")
                    .padding()
                    .background(Color.red)
            }
        }
        .cornerRadius(10)
        
        HStack{
            Rectangle()
                .padding()
                .background(Color.red)
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            VStack{
                Text("Jagung Rebus")
                Divider()
                Text("Jagungnya direbus pakai air dan dan api")
                
            }
            VStack{
                Text("4")
                    .font(.system(size: 38))
                Text("Karung")
            }
        }
        .background(Color.green)
        .cornerRadius(10)
        .padding()
        
        Spacer()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 12"], id: \.self) { deviceName in
                    ContentView()
                        .previewDevice(PreviewDevice(rawValue: deviceName))
                        .previewDisplayName(deviceName)
        }
    }
}
