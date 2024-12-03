//
//  LeaderboardView.swift
//  Every Day Go Up
//
//  Created by Wayne on 2024/12/2.
//

import SwiftUI

struct LeaderboardView: View {
    @EnvironmentObject var leaderboardStore: LeaderboardStore

    var body: some View {
        VStack {
            Text("Leaderboard")
                .font(.largeTitle)
                .padding()

            List(leaderboardStore.users) { user in
                HStack {
                    Text(user.username)
                        .font(.headline)
                    Spacer()
                    Text("\(user.idiomsLearned) idioms")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
        .navigationTitle("Leaderboard")
        .padding()
    }
}
