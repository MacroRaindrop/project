//
//  SummaryView.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 05/11/21.
//

import SwiftUI

struct SummaryView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("Ringkasan").font(.title) .bold().padding()
                Spacer()
                
            }
            HStack(alignment: .center){
                VStack(alignment: .center){
                    Text("27").font(.system(size: 60))
                    Text("Low Stock")
                }
                .padding()
                .background(Color.lowColor)
                .frame(width: 100, height: 150)
                
                VStack(alignment: .center){
                    Text("27").font(.system(size: 60))
                    Text("No Stock")
                }
                .padding()
                .background(Color.noStockColor)
                .frame(width: 100, height: 150)
                VStack(alignment: .center){
                    Text("27").font(.system(size: 60))
                    Text("Discontinued")
                }
                .padding()
                .background(Color.discontinueColor)
                .frame(width: 100, height: 150)
            } .padding(.horizontal, 30)
            VStack{
                listPO2()
//                VStack (alignment: .leading, spacing: 10){
//                    Text("PO1")
//                    Text("PT Nama Perusahaan")
//                    Divider()
//                }
//                VStack (alignment: .leading, spacing: 10){
//                    Text("PO1")
//                    Text("PT Nama Perusahaan")
//                    Divider()
//                }
//                VStack (alignment: .leading, spacing: 10){
//                    Text("PO1")
//                    Text("PT Nama Perusahaan")
//                    Divider()
//                }
                Text("View All")
            }.background(Color.ui.raindrop2) .cornerRadius(10)
                .padding()
            HStack {
                VStack {
                    VStack (alignment: .leading, spacing: 6){
                        Text("PO1")
                        Text("PT Nama Perusahaan")
                        Divider()
                    }
                    VStack (alignment: .leading, spacing: 6){
                        Text("PO1")
                        Text("PT Nama Perusahaan")
                        Divider()
                    }
                    VStack (alignment: .leading, spacing: 6){
                        Text("PO1")
                        Text("PT Nama Perusahaan")
                        Divider()
                    }
                    Text("View All")
                }.background(Color.raindrop1Color) .cornerRadius(10)
                    .padding()
            }
        }
    }
}


struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
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

