
import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    var body: some View {
        VStack {
            Toggle("Enable Dark Mode", isOn: $isDarkMode)
                .padding()
                .toggleStyle(SwitchToggleStyle(tint: .blue))
            
            Spacer()
        }
        .navigationTitle("Settings")
        .padding()
    }
}
