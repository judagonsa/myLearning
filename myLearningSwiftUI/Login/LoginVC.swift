//
//  LoginVC.swift
//  myLearningSwiftUI
//
//  Created by Julian González on 10/04/22.
//

import Foundation

class LoginVC: ObservableObject {
    
    func validateUserName (username: String)  -> Bool {
        if username.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$)"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        
        print("email: \(username), validación: \(emailPredicate.evaluate(with: username))")
        return emailPredicate.evaluate(with: username)
    }
    
    func validatePassword (password: String) -> Bool {
        
        if password.count < 8 {
            return false
        }
        
        let passwordFormat = "(?:(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$)"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordFormat)
        
        print("password: \(password), validación: \(passwordPredicate.evaluate(with: password))")
        return passwordPredicate.evaluate(with: password)
    }
    
    func registerUser (username: String, password: String) {
        print("registrar")
    }
    
    func loginUser (username: String, password: String) {
        print("iniciar sesión")
    }
    
}
