//
//  LoginVC.swift
//  myLearningSwiftUI
//
//  Created by Julian González on 10/04/22.
//

import Foundation

class LoginVC: ObservableObject {
    
    func validateUserName (username: String) -> Bool {
        print("validando usuario")
        return false
    }
    
    func registerUser (username: String, password: String) {
        print("registrar")
    }
    
    func loginUser (username: String, password: String) {
        print("iniciar sesión")
    }
    
}
