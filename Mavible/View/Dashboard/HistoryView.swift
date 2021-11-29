//
//  HistoryView.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 05/11/21.
//

import SwiftUI


struct HistoryView: View {
    
    
    init() {
        UISegmentedControl.appearance().backgroundColor = UIColor(CustomColor.buttonFont2)
    }
    
    @State var selected = 1
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading, spacing: 12) {
                Picker(selection: $selected, label: Text("Picker"), content: {
                    Text("Barang Masuk").tag(1)
                    Text("Barang Keluar").tag(2)
                })
                    .padding(.all)
                    .pickerStyle(SegmentedPickerStyle())
                
                let nameHistory = ["Kelapa Kering", "Minyak Kelapa", "Tepung Terigu", "Bubuk Coklat", "Keju Cheddar"]
                let stokHistory = ["+10", "+2", "+4", "+12", "+15"]
                let unitHistory = ["kg", "liter", "kg", "kg", "kotak"]
                let dateHistory = ["November 28, 2021", "November 27, 2021", "November 26, 2021", "November 25, 2021", "November 24, 2021"]
                
                if selected == 1 {
                    List(0..<5) { brg in
                        //                        inboundHistoryView()
                        VStack(alignment: .leading, spacing: 8) {
                            
//                            Text(date, style: .date)
                            Text(dateHistory[brg])
                            
                            HStack {
                                VStack (alignment: .leading) {
                                    HStack {
                                        VStack (alignment: .leading) {
                                            Text(nameHistory[brg])
                                                .fontWeight(.semibold)
                                            Text("")
                                            
                                        }
                                        
                                        Spacer()
                                        
                                        Text(stokHistory[brg])
                                            .font(.largeTitle)
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                        
                                    }
                                    
                                    HStack {
                                        Text("PIC: ")
                                        
                                        Text("Budi Goks")
                                            .font(.body).italic().opacity(0.6)
                                        
                                        Spacer()
                                        
                                        Text(unitHistory[brg])
                                        
                                        
                                        
                                    }
                                    
                                    Divider()
                                }
                                .foregroundColor(CustomColor.buttonFont)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(CustomColor.raindropColor, lineWidth: 3)
                                )
                            }
                            
                        }
                        .listStyle(PlainListStyle())
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
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}




//let oneDayAgo = now.addingTimeInterval(-3600 * 48)
let now = Date() // Dec 6, 2020 at 2:51 PM
let oneDay: TimeInterval = -1 * 24 * 60 * 60
let date = now.advanced(by: oneDay) // Dec 8, 2020 at 2:51 PM

//struct inboundHistoryView: View {
//
//    var body: some View {
//
//                VStack(alignment: .leading, spacing: 8) {
//
//                    Text(date, style: .date)
//
//
//                    HStack {
//                        VStack (alignment: .leading) {
//                            HStack {
//                                VStack (alignment: .leading) {
//                                    Text("Jagung Rebus")
//                                        .fontWeight(.semibold)
//                                    Text("-")
//
//                                }
//
//                                Spacer()
//
//                                Text("+26")
//                                    .font(.largeTitle)
//                                    .fontWeight(.semibold)
//                                    .multilineTextAlignment(.center)
//
//                            }
//
//                            HStack {
//                                Text("PIC: ")
//
//                                Text("Budi Goks")
//                                    .font(.body).italic().opacity(0.6)
//
//                                Spacer()
//
//                                Text("stok")
//
//
//
//                            }
//
//                            Divider()
//                        }
//                        .foregroundColor(CustomColor.buttonFont)
//                        .padding()
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 16)
//                                .stroke(CustomColor.raindropColor, lineWidth: 3)
//                        )
//                    }
//
//                }
//                .listStyle(PlainListStyle())
//
//
//
//    }
//}

struct outboundHistoryView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text(date, style: .date)
            
            HStack {
                VStack (alignment: .leading) {
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Jagung Rebus")
                                .fontWeight(.semibold)
                            Text("-")
                        }
                        
                        Spacer()
                        
                        Text("-26")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                    }
                    
                    
                    
                    HStack {
                        Text("PIC: ")
                        
                        Text("Budi Goks")
                            .font(.body).italic().opacity(0.6)
                        
                        Spacer()
                        
                        Text("stok")
                        
                    }
                    Divider()
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(CustomColor.raindropColor, lineWidth: 3)
                )
                
            }
        }
        //        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
}
