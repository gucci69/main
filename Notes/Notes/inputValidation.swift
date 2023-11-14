//
//  inputValidation.swift
//  Notes
//
//  Created by JoyDev on 14.11.2023.
//
import UIKit
import SnapKit

class InputValidation {
    
    static let shared = InputValidation()
    
    private init() {}
    
    func validateAndSaveData(login: String, email: String?, password: String, repeatedPassword: String?) -> Bool {
        
        guard !login.isEmpty, !password.isEmpty else {
            print("Fields login or password are not filled")
            return false
        }
        
        if let email = email, let repeatedPassword = repeatedPassword {
            // Если мы в режиме регистрации, нужно проверить ещё 2 поля
            guard !email.isEmpty, !repeatedPassword.isEmpty else {
                print("Fields email or repeated password are not filled")
                return false
            }
            
            guard emailIsValid(email) else {
                print("Email is not valid")
                return false
            }
            
            guard password == repeatedPassword else {
                print("Passwords do not match each other")
                return false
            }
        }
        
        return true
    }
    
    func emailIsValid(_ email: String) -> Bool {
        // Простейшая проверка на валидность email
        return email.contains("@")
    }
}


