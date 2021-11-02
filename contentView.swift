//
//  contentView.swift
//  TestGround
//
//  Created by Agni Muhammad on 02/11/21.
//

import SwiftUI

struct contentView: View {
    @State private var showAddDetailView = false
       
       var body: some View {
          Button("Show Modal") {
             self.showAddDetailView.toggle()
          }.sheet(isPresented: $showAddDetailView) {
              addDetailView(showModal: self.$showAddDetailView)
           }
       }
   }

struct contentView_Previews: PreviewProvider {
    static var previews: some View {
        contentView()
    }
}
