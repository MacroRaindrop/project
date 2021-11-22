//
//  SummaryView.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 05/11/21.
//

import SwiftUI

struct SummaryView: View {
    
    var body: some View {
<<<<<<< Updated upstream
        NavigationView {
            VStack{
=======
        
        NavigationView {
            
            VStack(spacing: 0) {
>>>>>>> Stashed changes
                ScrollView {
                    
                    VStack(spacing:0) {
                        Text("Inventori")
                            .font(.title)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                  
                        HStack(spacing: 0){
                            VStack(alignment: .center, spacing: 4){
                                Text("27")
                                    .font(.system(size: 36))
                                Text("Low Stock")
                                    .font(.system(size: 15))
                                
                            }
                            .frame(width: 109, height: 100)
                            .background(RoundedCorners(color: .lowColor, tl: 15, tr: 0, bl: 15, br: 0))
                            
                            
                            VStack{
                                Text("27")
                                    .font(.system(size: 36))
                                
                                Text("No Stocks")
                                    .font(.system(size: 15))
                            }
                            .frame(width: 120, height: 100)
                            .background(Color.noStockColor)
                            .padding(.all, 8)
                            
                            
                            VStack(alignment: .center){
                                Text("27")
                                    .font(.system(size: 36))
                                Text("Discontinued")
                                    .font(.system(size: 15))
                            }
                            .frame(width: 109, height: 100)
                            .background(RoundedCorners(color: .discontinueColor, tl: 0, tr: 15, bl: 0, br: 15))
                        }
                    
                        ScrollView {
                            VStack{
                                listPO2()
                                Text("View All")
                            }.background(Color.ui.raindrop2) .cornerRadius(10)
                                .padding()
                        }
                        ScrollView {
                            VStack {
                                listPO3()
                                Text("View All")
                            }.background(Color.ui.raindrop2) .cornerRadius(10)
                                .padding()
                        }
                    }.navigationBarBackButtonHidden(true)
                }
<<<<<<< Updated upstream
                ScrollView {
                    VStack {
                        listPO3()
                        Text("View All")
                    }.background(Color.ui.raindrop2) .cornerRadius(10)
                        .padding()
                }
            }
            .navigationTitle("Ringkasan")
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
=======
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Ringkasan")
        }
>>>>>>> Stashed changes
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

struct listPO2: View {
    @State private var jumlah: String = ""
    var body: some View {
        //            List(positions, rowContent: { position in
        //                Text(position.name)
        //            })
        //                .font(.largeTitle)
        //            List(tutors) { tutor in
        //                TutorCell(tutor: tutor)
        //            }
        List(0 ..< 3) { item in
            HStack {
                VStack (alignment: .leading, spacing: 5) {
                    Text("PO 1")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("PT binjai")
                }
                NavigationLink(destination: POdetail()){
                }
            }
            .padding(.top, 10)
            .listRowBackground(Color.ui.raindrop2)
            //                .overlay(
            //                        RoundedRectangle(cornerRadius: 3)
            //                            .stroke(Color.white, lineWidth: 1)
            //                )
        }
        .listStyle(PlainListStyle())
        .cornerRadius(10)
        .scaledToFill()
        .padding()
        .frame(width: 350, height: 300)
        //.overlay(RoundedRectangle(cornerRadius: 10))
    }
}
struct listPO3: View {
    @State private var jumlah: String = ""
    var body: some View {
        //            List(positions, rowContent: { position in
        //                Text(position.name)
        //            })
        //                .font(.largeTitle)
        //            List(tutors) { tutor in
        //                TutorCell(tutor: tutor)
        //            }
        List(0 ..< 3) { item in
            HStack {
                VStack (alignment: .leading, spacing: 5) {
                    Text("PO 1")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("PT binjai")
                }
                NavigationLink(destination: POdetail()){
                }
            }
            .padding(.top, 10)
            .listRowBackground(Color.ui.raindrop2)
            //                .overlay(
            //                        RoundedRectangle(cornerRadius: 3)
            //                            .stroke(Color.white, lineWidth: 1)
            //                )
        }
        .listStyle(PlainListStyle())
        .cornerRadius(10)
        .scaledToFill()
        .padding()
        .frame(width: 350, height: 300)
        //.overlay(RoundedRectangle(cornerRadius: 10))
    }
}


