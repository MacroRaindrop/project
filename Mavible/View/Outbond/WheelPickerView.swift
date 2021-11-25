//
//  WheelPickerView.swift
//  Mavible
//
//  Created by Fandika Ikhsan on 24/11/21.
//

import SwiftUI

struct WheelPickerView: View {
    @State private var selectedStrength = "Mild"
    let strengths = ["Mild", "Medium", "Mature"]

    var body: some View {
        NavigationView {
            
            List {
                
                Section {
                    Picker("Strength", selection: $selectedStrength) {
                        ForEach(strengths, id: \.self) {
                            Text($0)
                        }
                    }
                }.pickerStyle(WheelPickerStyle())
            }
            .navigationTitle("Select your cheese")
        }
    }
}

struct WheelPickerView_Previews: PreviewProvider {
    static var previews: some View {
        WheelPickerView()
    }
}
