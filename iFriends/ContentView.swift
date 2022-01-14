//
//  ContentView.swift
//  iFriends
//
//  Created by Victor Colen on 13/01/22.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(users, id: \.id) { user in
                        NavigationLink {
                            DetailUserView(user: user)
                        } label: {
                            HStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(user.isActive ? .green : .red)
                                Text(user.name)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
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
