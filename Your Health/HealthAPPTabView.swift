//
//  ContentView.swift
//  Health_App
//
//  Created by mac on 3/13/25.
//

import SwiftUI

struct HealthAPPTabView: View {
    var body: some View {
        TabView {
            UserProfileView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            DietPlanView()
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("Diet")
                }
            
            RecipeManagementView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Recipes")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .accentColor(.brandPrimary)
    }
}

#Preview {
    HealthAPPTabView()
}

