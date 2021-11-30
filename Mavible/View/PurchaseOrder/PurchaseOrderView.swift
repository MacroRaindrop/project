//
//  PurchaseOrderView.swift
//  Mavible
//
//  Created by Rostadhi Akbar, M.Pd on 15/11/21.

import SwiftUI

struct PurchaseOrderView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack{
                    Text("Buat PO")
                        .padding(15.0)
                        .font(.system(size: 30, weight: .bold))
                }
                
                VStack {
                    HStack {
                        Text("PIC")
                            .font(Font.headline.weight(.bold))
                        Spacer()
                    }
                    HStack{
                        Picker(selection: .constant("pilih PIC"), label: Text("Picker")
                        ) {
                            Text("staff1").tag(1)
                            Text("staff2").tag(2)
                            Text("staff3").tag(3)
                                .frame(width: UIScreen.main.bounds.width - 40)
                        }
                        .font(.system(size: 14))
                        .frame(width: 333, height: 34)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 10)
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                        .pickerStyle(WheelPickerStyle())
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
                        .font(.system(size: 14))
                        .frame(width: 333, height: 34)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 10)
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                        .pickerStyle(WheelPickerStyle())
                        
                        Spacer()
                            .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/)
                    }
                    Spacer()
                    NavigationLink(destination: PO1View(text: .constant(""), qty: .constant(""))){
                        Text("Lanjut")
                            .frame(maxWidth: 219, maxHeight: 20)
                            .font(.system(size: 20))
                            .padding()
                            .foregroundColor(.black)
                            .background(CustomColor.discontinueColor)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding()
                    }
                    
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
