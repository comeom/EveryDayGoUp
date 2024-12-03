import Foundation

class LeaderboardStore: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        loadUsers()
    }

    // Load users from UserDefaults (if saved previously)
    func loadUsers() {
        if let savedUsers = UserDefaults.standard.data(forKey: "users") {
            let decoder = JSONDecoder()
            if let loadedUsers = try? decoder.decode([User].self, from: savedUsers) {
                self.users = loadedUsers
                sortLeaderboard() // Ensure users are sorted on load
            }
        }
    }

    // Save users to UserDefaults
    func saveUsers() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(users) {
            UserDefaults.standard.set(encoded, forKey: "users")
        }
    }

    // Add or update a user's progress
    func updateUserProgress(username: String, learned: Int) {
        // Check if the user already exists
        if let index = users.firstIndex(where: { $0.username == username }) {
            // If user exists, update their progress
            users[index].idiomsLearned = learned
        } else {
            // If user does not exist, create a new user and add to the list
            let newUser = User(username: username, idiomsLearned: learned)
            users.append(newUser)
        }
        
        // Sort the users based on the number of idioms learned in descending order
        sortLeaderboard()
        
        // Save the updated users data
        saveUsers()
    }

    // Sort users by idioms learned in descending order
    private func sortLeaderboard() {
        users.sort { $0.idiomsLearned > $1.idiomsLearned }
    }
}
