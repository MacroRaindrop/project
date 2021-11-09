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
                .background(Color.raindropColor)
                .frame(width: 128, height: 150)
                
                VStack{
                    Text("27").font(.system(size: 60))
                    Text("Total Stock")
                }
                .padding()
                .background(Color.raindropColor)
                .frame(width: 120, height: 0)
                VStack{
                    Text("27").font(.system(size: 60))
                    Text("Total Stock")
                }
                .padding()
                .background(Color.raindropColor)
                .frame(width: 120, height: 0)
            }
            VStack{
                VStack (alignment: .leading, spacing: 10){
                    Text("PO1")
                    Text("PT Nama Perusahaan")
                    Divider()
                }
                VStack (alignment: .leading, spacing: 10){
                    Text("PO1")
                    Text("PT Nama Perusahaan")
                    Divider()
                }
                VStack (alignment: .leading, spacing: 10){
                    Text("PO1")
                    Text("PT Nama Perusahaan")
                    Divider()
                }
                Text("View All")
            }.background(Color.raindropColor) .cornerRadius(10)
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
                }
            }
        }
    }
}


struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
