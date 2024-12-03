//
//  User.swift
//  Every Day Go Up
//
//  Created by Wayne on 2024/12/3.
//

import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    var username: String
    var idiomsLearned: Int

    init(username: String, idiomsLearned: Int) {
        self.id = UUID()
        self.username = username
        self.idiomsLearned = idiomsLearned
    }
}
