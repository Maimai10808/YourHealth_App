//
//  UserProfile.swift
//  Health_App
//
//  Created by mac on 3/14/25.
//

import SwiftUI

struct UserProfileView: View {
    @StateObject var viewModel = UserProfileViewModel()
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("Your Name", text: $viewModel.user.Name)
                    TextField("Your Weight", text: $viewModel.user.Weight)
                    TextField("Your Height", text: $viewModel.user.Height)
                    TextField("Your Email,We can remind you.", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                Section(header: Text("Requests")) {
                    Toggle("Requests1", isOn: $viewModel.user.Requests1)
                        .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                    Toggle("Requests2", isOn: $viewModel.user.Requests2)
                        .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                    Toggle("Requests3", isOn: $viewModel.user.Requests3)
                        .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                    
                    
                }
                
            }
            
            .navigationTitle("User Profile")
            
        }
    }
}
#Preview {
    UserProfileView()
}
