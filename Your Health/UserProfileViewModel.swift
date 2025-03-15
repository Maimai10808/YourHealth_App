//
//  UserProfileViewModel.swift
//  Health_App
//
//  Created by mac on 3/14/25.
//

import SwiftUI



final class UserProfileViewModel: ObservableObject {
    
    
    @AppStorage("user")  private var userData: Data?
    
    @Published var user = User()
    
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !user.Name.isEmpty && !user.Height.isEmpty && !user.Weight.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func retrieveUser() {
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
        
        
        
    }
    
}

