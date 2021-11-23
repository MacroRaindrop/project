//
//  loadingVIew.swift
//  Mavible
//
//  Created by vincent meidianto on 22/11/21.
//

import SwiftUI

struct loadingVIew: View {
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .scaleEffect(4)
            
        }
    }
}

struct loadingVIew_Previews: PreviewProvider {
    static var previews: some View {
        loadingVIew()
    }
}
