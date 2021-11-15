//
//  PurchaseOrderView.swift
//  TestGround
//
//  Created by Rostadhi Akbar, M.Pd on 05/11/21.
//

import SwiftUI

struct PurchaseOrderView: View {
    @State var identity: String = ""
    @State var pic: String? = nil
    @State var arraypic = ["pic1", "pic2", "pic3"]
    @State var label: String = ""
    
    @State var identityNull: Bool = false
    @State var picNull: Bool = false
    @State var labelNull: Bool = false
    
    @State var selectionIndex = 0

    var body: some View {
        ZStack {
            VStack {
                //ganti ke navigation title, tambahin back button
                Text("Buat PO")
                    .padding()
                    .font(.system(size: 30, weight: .bold))
            VStack {
                HStack {
                    Text("PIC")
                        .font(Font.headline.weight(.bold))
                        Spacer()
                        }
                TextFieldWithInputView(data: self.arraypic, placeholder: "Pilih PIC", selectionIndex: self.$selectionIndex, selectedText: self.$pic)
                    .frame(width: UIScreen.main.bounds.width - 40, height: 25)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .keyboardType(.default)
                        .autocapitalization(.none)
                    HStack {
                        Text("Label")
                        .font(Font.headline.weight(.bold))
                        Spacer()
                        }
                        TextField("Pilih Label", text: self.$label)
                    .frame(width: UIScreen.main.bounds.width - 40, height: 25)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                                .keyboardType(.default)
                                .autocapitalization(.none)
                Spacer()
                        Text("Lanjut")
                            .frame(maxWidth: 219, maxHeight: 20)
                            .font(.system(size: 20))
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.raindropColor)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding()
                    }
                    Spacer()
                        .frame(height: 100)
                }
                .padding()
                
            }
        }
    }


struct PurchaseOrderView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseOrderView()
    }
}



//handler untuk textfield dgn input picker
struct TextFieldWithInputView : UIViewRepresentable {

  var data : [String]
  var placeholder : String

  @Binding var selectionIndex : Int
  @Binding var selectedText : String?

  private let textField = UITextField()
  private let picker = UIPickerView()

  func makeCoordinator() -> TextFieldWithInputView.Coordinator {
       Coordinator(textfield: self)
  }

  func makeUIView(context: UIViewRepresentableContext<TextFieldWithInputView>) -> UITextField {
       picker.delegate = context.coordinator
       picker.dataSource = context.coordinator
       picker.backgroundColor = .gray
       picker.tintColor = .black
       textField.placeholder = placeholder
       textField.inputView = picker
       textField.delegate = context.coordinator
       return textField
  }

  func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<TextFieldWithInputView>) {
       uiView.text = selectedText
  }

  class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate , UITextFieldDelegate {

       private let parent : TextFieldWithInputView

       init(textfield : TextFieldWithInputView) {
            self.parent = textfield
       }

       func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
       }
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return self.parent.data.count
       }
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return self.parent.data[row]
       }
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.parent.$selectionIndex.wrappedValue = row
            self.parent.selectedText = self.parent.data[self.parent.selectionIndex]
            self.parent.textField.endEditing(true)

       }
       func textFieldDidEndEditing(_ textField: UITextField) {
            self.parent.textField.resignFirstResponder()
       }
 }
}
