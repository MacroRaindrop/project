//
//  OutbondListView.swift
//  Macro-Raindrop
//
//  Created by Fandika Ikhsan on 08/11/21.
//

import SwiftUI

struct OutbondListView: View {
    @State var query: String = ""
    @State var outbondDate: String = "27 Oktober 2021"
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text(outbondDate)
                    .font(.caption)
                
                List {
                    ForEach(0 ..< 2) { i in
                        OutbondListContentView()
                    }
                }
                
                Spacer()
                
                Button(action: {print("...")}) {OutbondButtonContent(buttonColor: CustomColor.raindrop1Color, buttonText: "Lanjut")}
            }
            .navigationTitle("Outbond")
            .searchable(text: $query)
            .navigationBarItems(leading:
                                    Button(action: {print("...")}) {Image(systemName: "chevron.left")})
            
        }
        
        
    }
}

struct OutbondListView_Previews: PreviewProvider {
    static var previews: some View {
        OutbondListView()
    }
}

//
//  OutbondButtonView.swift
//  Macro-Raindrop
//
//  Created by Fandika Ikhsan on 08/11/21.
//

import SwiftUI

struct OutbondButtonContent : View {
    
    @State var buttonColor: Color
    @State var buttonText: String = ""
    
    var body: some View {
        return Text(buttonText)
            .frame(maxWidth: 300, maxHeight: 20)
            .font(.system(size: 20))
            .padding()
            .foregroundColor(.black)
            .background(buttonColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct OutbondListContentView: View {
    @State var imageList: String = "beras-asset"
    @State var strokeColor: Color = .yellow
    @State var titleText: String = "This is title"
    @State var captionText: String = "This is caption This is Captiopn This is Caption"
    @State var qtyText: Int = 1
    @State var satuanText: String = "Satuan"
    
    var body: some View {
        HStack {
            Image(imageList)
                .resizable()
                .scaledToFit()
                .frame(height: 70, alignment: .leading)
            
            VStack (alignment: .leading, spacing: 2) {
                Text(titleText)
                    .font(.body)
                    .bold()
                UserField(userFieldCutWidth: 200)
            }
            
            VStack (alignment: .center, spacing: 20) {
                Text("Stok: " + String(qtyText))
                    .font(.body)
                HStack {
                    Button(action: {print("...")}) {Image(systemName: "plus")}
                    Button(action: {print("...")}) {Image(systemName: "plus")}
                }
            }
            
        }
    }
}

struct UserField: View {
    @State var idOutbond: String = ""
    @State var userFieldCutWidth: CGFloat
    
    var body: some View {
        TextField("OB1", text: $idOutbond)
            .frame(width: UIScreen.main.bounds.width - userFieldCutWidth)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}
