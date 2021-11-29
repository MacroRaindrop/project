//
//  SummaryView.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 05/11/21.
//

import SwiftUI

struct SummaryView: View {
    @State private var goesToPOList = false
    @State private var settingProfile = false
    
    let lowStockNumber = 3
    let noStockNumber = 5
    let discontinuedNumber = 0
    let profileImage = Image(systemName: "person.circle")
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing:0){
                    //                    Spacer()
                    
                    //                    profileImage
                    //                        .resizable()
                    //                        .frame(width: 32, height: 32)
                    //                        .frame(maxWidth: .infinity, alignment: .trailing)
                    //                        .padding(.trailing, 24)
                    //                        .padding(.bottom, 12)
                    
                    //                    Spacer()
                    
                    Text(date, style: .date)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 24)
                    //                        .offset(y: -40)
                    
                    Text("Inventori")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    ScrollView {
                        HStack(alignment: .center){
                            
                            VStack(alignment: .center){
                                Text("\(lowStockNumber)")
                                    .font(.system(size: 36))
                                Text("Low Stock")
                                    .font(.system(size: 15))
                            }
                            .frame(width: 109, height: 100)
                            .background(RoundedCorners(color: CustomColor.lowColor, tl: 15, tr: 0, bl: 15, br: 0))
                            
                            VStack(alignment: .center){
                                Text("\(noStockNumber)")
                                    .font(.system(size: 36))
                                Text("No Stock")
                                    .font(.system(size: 15))
                            }
                            .frame(width: 109, height: 100)
                            .background(RoundedCorners(color: CustomColor.noStockColor, tl: 0, tr: 0, bl: 0, br: 0))
                            
                            VStack(alignment: .center){
                                Text("\(discontinuedNumber)")
                                    .font(.system(size: 36))
                                Text("Discontinued")
                                    .font(.system(size: 15))
                            }
                            .frame(width: 109, height: 100)
                            .background(RoundedCorners(color: CustomColor.discontinueColor, tl: 0, tr: 15, bl: 0, br: 15))
                        }
                        .foregroundColor(CustomColor.buttonFont)
                    }
                    
                    Text("Purchase Order")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("ButtonFont"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    ScrollView {
                        VStack{
                            
                            listPurchaseOrder()
                            
                            
                            NavigationLink(
                                destination: daftarPO(),
                                isActive: $goesToPOList) {
                                    Button(action: { goesToPOList = true }) {
                                        Text("View All")
                                            .fontWeight(.regular)
                                            .foregroundColor(CustomColor.buttonFont)
                                    }
                                }
                                .padding()
                        }
                        .background(Color("raindrop2"))
                        .cornerRadius(15.0)
                    }
                    
                    
                    Text("Barang Keluar Hari Ini")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("ButtonFont"))
                        .padding(.all)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    ScrollView {
                        VStack {
                            listOutbound()
                        }
                    }
                    .background(Color.ui.raindrop2)
                    .cornerRadius(15)
                }
            }
            .navigationTitle("Ringkasan")
            .navigationBarTitle(Text("Ringkasan"))
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing: Button(action: {
                // button activates link
                self.settingProfile = true
            } ) {
                profileImage
                    .resizable()
                    .foregroundColor(.black)
                    .padding(2)
                    .frame(width: 36, height: 36)
            } )
//            .toolbar {
//                Button(action: {
//                    // button activates link
//                    self.settingProfile = true
//                } ) {
//                    profileImage
//                        .resizable()
//                        .foregroundColor(.black)
//                        .padding(2)
//                        .frame(width: 36, height: 36)
//                }
//            }
        }
        //
        //        // invisible link inside NavigationView for add mode
        //        NavigationLink(destination: UpdateView(existingItem: nil),
        //                       isActive: $settingProfile) { EmptyView() }
        
    }
}




struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}


struct RoundedCorners: View {
    var color: Color = .blue
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                let w = geometry.size.width
                let h = geometry.size.height
                
                // Make sure we do not exceed the size of the rectangle
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                path.closeSubpath()
            }
            .fill(self.color)
        }
    }
}

//struct listPO2: View {
//    @State private var jumlah: String = ""
//
//    var body: some View {
//        List(0 ..< 30) { item in
//
//        }
//    }
//}

struct listPurchaseOrder: View {
    @State private var jumlah: String = ""
    var body: some View {
        List(0 ..< 30) { item in
            HStack {
                VStack (alignment: .leading, spacing: 5) {
                    Text("PO" + String(item+1))
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("ButtonFont"))
                    switch (item) {
                    case 0:
                        Text("PT Roti Sederhana")
                            .foregroundColor(Color("ButtonFont"))
                            .opacity(0.6)
                    case 1:
                        Text("PT Sayang Ibu")
                            .foregroundColor(Color("ButtonFont"))
                            .opacity(0.6)
                    default:
                        Text("PT Mikro Kelapa")
                            .foregroundColor(Color("ButtonFont"))
                            .opacity(0.6)
                    }
                }
                NavigationLink(destination: POdetail()){
                }
            }
            .padding(.top, 10)
            .listRowBackground(Color.ui.raindrop2)
        }
        .listStyle(PlainListStyle())
        .cornerRadius(10)
        .frame(width: 344, height: 242)
    }
}

struct listOutbound: View {
    @State private var jumlah: String = ""
    @State private var outboundHariIni = 0
    let unit = ["liter", "kg", "karton"]
    
    var body: some View {
        List(0 ..< 30) { item in
            HStack {
                switch (item) {
                case 0:
                    Text("Kelapa Kering")
                    Text("-\(2) \(unit[1])")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                case 1:
                    Text("Tepung Terigu")
                    Text("-\(10) \(unit[1])")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                default:
                    Text("Minyak Kelapa")
                    Text("-\(3) \(unit[0])")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            .padding(.top, 10)
            .listRowBackground(Color.ui.raindrop2)
            .listRowSeparator(.hidden)
        }
        .listStyle(PlainListStyle())
        .cornerRadius(15)
        .frame(width: 344, height: 242)
    }
}


