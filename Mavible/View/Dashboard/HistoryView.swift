//
//  HistoryView.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 05/11/21.
//

import SwiftUI


struct HistoryView: View {
    
    
    init() {
        UISegmentedControl.appearance().backgroundColor = UIColor(CustomColor.raindrop2)
    }
    
    @State var selected = 1
    
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading, spacing: 2) {
                Picker(selection: $selected, label: Text("Picker"), content: {
                    Text("Inbound").tag(1)
                    Text("Outbound").tag(2)
                })
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .pickerStyle(SegmentedPickerStyle())
                
                if selected == 1 {
                    List(0..<5) {_ in
                        inboundHistoryView()
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(PlainListStyle())
                    
                    
                } else {
                    List {
                        ForEach(1..<100) { index in
                            outboundHistoryView()
                                .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Riwayat")
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}





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
