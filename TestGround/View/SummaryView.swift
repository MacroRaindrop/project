//
//  SummaryView.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 05/11/21.
//

import SwiftUI

struct SummaryView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Ringkasan")
                    .padding(.leading)
                    .font(.system(size: 30, weight: .bold))
                    
            }
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
