//
//  MainView.swift
//  Every Day Go Up
//
//  Created by Wayne on 2024/12/3.
//

import SwiftUI



struct MainView: View {
    @ObservedObject var idiomStore: IdiomStore
    @ObservedObject var leaderboardStore: LeaderboardStore
    @Binding var username: String
    @Binding var isDarkMode: Bool
    @State private var showResetPopup = false
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Every Day Go Up \n 天天向上")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Username: \(username)")
                    .font(.headline)
                    .padding()
                
                Text("Idioms Learned: \(idiomStore.completedIdioms.count)")
                    .font(.headline)
                    .foregroundColor(.blue)
                
                NavigationLink(destination: LearnView(idiomStore: idiomStore)) {
                    Text("Learn Today's Idiom")
                        .buttonStyleMain()
                }
                
                NavigationLink(destination: ReviewView(idiomStore: idiomStore)) {
                    Text("Review Idioms")
                        .buttonStyleMain()
                }
                
                NavigationLink(destination: SettingsView()) {
                    Text("Settings")
                        .buttonStyleMain()
                }
                
                NavigationLink(destination: LeaderboardView().environmentObject(leaderboardStore)) {
                    Text("Leaderboard")
                        .buttonStyleMain()
                }
                
                Button(action: {
                    idiomStore.reset()
                    showResetPopup = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        showResetPopup = false
                    }
                }) {
                    Text("Reset Progress")
                        .font(.headline)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                if showResetPopup {
                    Text("Idioms Reset!")
                        .font(.body)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(8)
                        .transition(.opacity)
                }
                
                
                Spacer()
            }
            .padding()
            .navigationBarHidden(true)
            .preferredColorScheme(isDarkMode ? .dark : .light)
            
        }
    }
    
}

extension View {
    func buttonStyleMain() -> some View {
        self
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
