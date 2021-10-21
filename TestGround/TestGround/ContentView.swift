//
//  ContentView.swift
//  TestGround
//
//  Created by Gerald Stephanus on 21/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Summary").font(.title) .bold().padding()
                Spacer()
                Text("18 Okt 2021") .padding()
            }
            HStack{
                
                VStack{
                    Text("27").font(.system(size: 60))
                    Text("Total Stock")
                }
                    .padding()
                    .background(Color.gray)
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
            
            VStack{
                VStack (alignment: .leading, spacing: 6){
                    Text("PO1")
                    Text("PT Nama Perusahaan")
                    Divider()
                }
                VStack{
                    Text("PO1")
                    Text("PT Nama Perusahaan")
                    Divider()
                }
                VStack{
                    Text("PO1")
                    Text("PT Nama Perusahaan")
                    Divider()
                }
                Text("View All")
            }.background(Color.gray) .cornerRadius(10).padding()
        
            VStack{
                Text("Today's Outbound") .bold()
                HStack{
                    padding()
                    Text("Kecap Def")
                    Spacer()
                    Text("14 pcs")
                    padding()
                }
                HStack{
                    padding()
                    Text("Kecap Def")
                    Spacer()
                    Text("14 pcs")
                    padding()
                }
                HStack{
                    padding()
                    Text("Kecap Def")
                    Spacer()
                    Text("14 pcs")
                    padding()
                }
            }.background(Color.gray) .cornerRadius(10).padding()
        
        }
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
