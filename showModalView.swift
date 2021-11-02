//
//  contentView.swift
//  TestGround
//
//  Created by Agni Muhammad on 02/11/21.
//

import SwiftUI

struct showModalView: View {
    @State private var showAddDetailView = false
       
       var body: some View {
          Button("Show Modal") {
             self.showAddDetailView.toggle()
          }.sheet(isPresented: $showAddDetailView) {
              addDetailView(showModal: self.$showAddDetailView)
           }
       }
   }

struct showModalView_Previews: PreviewProvider {
    static var previews: some View {
        showModalView()
    }
}
