//
//  PurchaseOrderView.swift
//  Mavible
//
//  Created by Rostadhi Akbar, M.Pd on 15/11/21.
//

import SwiftUI

struct PurchaseOrderView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Buat PO")
                    .padding()
                    .font(.system(size: 30, weight: .bold))
            VStack {
                HStack {
                    Text("PIC")
                        .font(Font.headline.weight(.bold))
                            Spacer()
                    }
                HStack{
                    Picker(selection: .constant("pilih PIC"), label: Text("Picker")) {
                        Text("staff1").tag(1)
                        Text("staff2").tag(2)
                        Text("staff3").tag(3)
                            .frame(width: UIScreen.main.bounds.width - 40)
                    }
                    Spacer()
                }
                
                HStack {
                    Text("Supplier")
                        .font(Font.headline.weight(.bold))
                        Spacer()
                        }
                HStack{
                    Picker(selection: .constant("pilih PIC"), label: Text("Picker")) {
                        Text("supplier1").tag(1)
                        Text("supplier2").tag(2)
                        Text("supplier3").tag(3)
                            .frame(width: UIScreen.main.bounds.width - 40)
                    }
                    
                    Spacer()
                }

                        Text("Lanjut")
                            .frame(maxWidth: 219, maxHeight: 20)
                            .font(.system(size: 20))
                            .padding()
                            .foregroundColor(.black)
                            .background(CustomColor.discontinueColor)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding()
                    }
                    Spacer()
                        .frame(height: 100)
                }
                .padding()
                Spacer()
            }
        }
    }



struct PurchaseOrderView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseOrderView()
    }
}
