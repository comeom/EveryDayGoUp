//
//  ContentView.swift
//  Every Day Go Up
//
//  Created by Wayne on 2024/12/2.
//

import SwiftUI

struct ContentView: View {
    @StateObject var idiomStore = IdiomStore()
    @StateObject var leaderboardStore = LeaderboardStore()
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var username = ""
    @State private var showUsernameInput = false // Show username input view
    
    var body: some View {
        // If it's the first launch, show the username input view
        if showUsernameInput {
            UsernameInputView(username: $username, onSubmit: {
                // Save the username to UserDefaults and update the leaderboard
                UserDefaults.standard.set(username, forKey: "username")
                leaderboardStore.updateUserProgress(username: username, learned: idiomStore.completedIdioms.count)
                showUsernameInput = false // Hide the username input view and go to the main view
            })
        } else {
            MainView(idiomStore: idiomStore, leaderboardStore: leaderboardStore, username: $username, isDarkMode: $isDarkMode)
                .onAppear {
                    // Check if the username is saved in UserDefaults, if not, show the username input view
                    if let savedUsername = UserDefaults.standard.string(forKey: "username") {
                        username = savedUsername
                        leaderboardStore.updateUserProgress(username: savedUsername, learned: idiomStore.completedIdioms.count)
                    } else {
                        showUsernameInput = true // Show username input if not set
                    }
                }
        }
    }
}



#Preview {
    ContentView()
}
