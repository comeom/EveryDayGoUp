//
//  UsernameInputView.swift
//  Every Day Go Up
//
//  Created by Wayne on 2024/12/3.
//

import SwiftUI

struct UsernameInputView: View {
    @Binding var username: String
    var onSubmit: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Enter your Username")
                .font(.largeTitle)
                .padding()
            
            TextField("Username", text: $username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button(action: {
                if !username.isEmpty {
                    onSubmit() // Call the onSubmit closure to save the username and go to main view
                }
            }) {
                Text("Submit")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
