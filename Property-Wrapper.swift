//
//  Property-Wrapper.swift
//  
//
//  Created by Bhavesh Odedara on 09/05/20.
//

import UIKit

@propertyWrapper
struct Email<Value: StringProtocol> {
    private var value: Value?
    init(wrappedValue value: Value?) {
        self.value = value
    }
    var wrappedValue: Value? {
        get {
            return validate(email: value) ? value : nil
        }
        set {
            value = newValue
        }
    }
    
    private func validate(email: Value?) -> Bool {
        guard let email = email else { return false }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredict = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredict.evaluate(with: email)
    }
}

@propertyWrapper
struct PhoneNumber<Value: StringProtocol> {
    private var value: Value?
    init(wrappedValue value: Value?) {
        self.value = value
    }
    var wrappedValue: Value? {
        get {
            return validate(PhoneNumber: value) ? value : nil
        }
        set {
            value = newValue
        }
    }
    
    private func validate(PhoneNumber: Value?) -> Bool {
        guard let phoneNumber = PhoneNumber else { return false }
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phonePredict = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredict.evaluate(with: phoneNumber)
    }
}

//--------------------------------------------------------------
struct AppValidation {
    @Email var email: String?
    @PhoneNumber var phoneNumber: String?
}

func Validation() {
    
    var valid = AppValidation()
    valid.email = "abc@xyz.com"
    valid.phoneNumber = "98098998"
    
    if (valid.email != nil) {
        print(valid.email!)
    } else {
        print("invalid email")
    }
    
    if (valid.phoneNumber != nil) {
        print(valid.phoneNumber!)
    } else {
        print("invalid phone number")
    }
}

_ = Validation()
