//
//  ContentView.swift
//  iFriends
//
//  Created by Victor Colen on 13/01/22.
//

import SwiftUI

struct User: Codable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friend]
}

struct Friend: Codable {
    var id: UUID
    var name: String
}

struct ContentView: View {
    @State private var users = [User]()
    var body: some View {
        List(users, id: \.id) { user in
            VStack {
                Text(user.name)
                Text(user.company)
                Text("\(user.age) years old")
                Text("Friends: ")
                ForEach(user.friends, id: \.id) { friend in
                    Text(friend.name)
                }
            }
        }
            .task {
                await loadUsers()
            }
    }
    
    func loadUsers() async  {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode([User].self, from: data)
            users = decodedResponse
        } catch {
            print(error)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
