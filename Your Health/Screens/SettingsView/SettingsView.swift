import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("App Settings")) {
                    Toggle("Dark Mode", isOn: .constant(false))
                    Toggle("Notifications", isOn: .constant(true))
                }
                
                Section(header: Text("About")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
} 