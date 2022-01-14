//
//  ContentView.swift
//  iFriends
//
//  Created by Victor Colen on 13/01/22.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    @Environment(\.managedObjectContext) var moc
    
    let columns = [
        GridItem(.flexible(minimum: 300, maximum: 500))
    ]
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                NavigationLink {
                    DetailUserView(user: user)
                } label: {
                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundColor(user.isActive ? .green : .red)
                        Image(systemName: "person.circle.fill")
                            .font(.largeTitle)
                        Text(user.name)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("iFriends")
            .task {
                if users.isEmpty {
                    await loadUsers()
                }
            }
        }
    }
    
    func loadUsers() async  {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedResponse = try decoder.decode([User].self, from: data)
            users = decodedResponse
            users.sort()
            
            for user in users {
                let cachedUser = CachedUser(context: moc)
                cachedUser.id = user.id
                cachedUser.registered = user.registered
                cachedUser.tags = user.tags.joined(separator: ",")
                cachedUser.email = user.email
                cachedUser.company = user.company
                cachedUser.address = user.address
                cachedUser.about = user.about
                cachedUser.isActive = user.isActive
                cachedUser.name = user.name
                for friend in user.friends {
                    let cachedFriend = CachedFriend(context: moc)
                    cachedFriend.id = friend.id
                    cachedFriend.name = friend.name
                }
            }
            try? moc.save()
            print("Saved successfully")
            
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
