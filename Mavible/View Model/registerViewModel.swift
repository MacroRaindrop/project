//
//  RegisterViewModel.swift
//  Mavible
//
//  Created by Rostadhi Akbar, M.Pd on 19/11/21.
//

import Foundation
class SignupViewModel: ObservableObject {
    @Published var email = ""
   // @Published var validEmail = true
    func isEmailValid() -> Bool {
        // criteria in regex.  See http://regexlib.com
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: email)
    }
    var validEMail: Bool {
        if isEmailValid() {
             return true
        } else {
            return false
        }
    }
}
