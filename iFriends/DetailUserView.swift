//
//  DetailUserView.swift
//  iFriends
//
//  Created by Victor Colen on 13/01/22.
//

import SwiftUI

struct DetailUserView: View {
    var user: User
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text(user.name.capitalized)
                    .font(.headline)
            }
            
            VStack(spacing: 20) {
                HStack(spacing: 2) {
                    Image(systemName: "circle.fill")
                        .foregroundColor(user.isActive ? .green : .red)
                    Text(user.isActive ? "Online" : "Offline")
                }
                
                VStack(alignment: .leading) {
                Text("About")
                    .font(.title.bold())
                    .padding([.bottom, .top], 10)
                    
                Text(user.about)
                    
                Text("More Info")
                        .font(.title.bold())
                        .padding([.bottom, .top], 10)
                    Text("\(user.name) is \(user.age) and works @\(user.company).")
                }
                
                HStack {
                    Spacer()
                Text("Member since \(user.registered.formatted(date: .abbreviated, time: .omitted))")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.trailing)
                    .padding(.bottom, 30)
                }
                    
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(user.friends, id: \.id) { friend in
                        VStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 100, height: 100)
                            Text(friend.name.capitalized)
                        }
                    }
                }
            }
        }
        .navigationTitle("Person Info")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailUserView_Previews: PreviewProvider {
    static var previews: some View {
        DetailUserView(user: User(id: UUID(), isActive: true, name: "milp", age: 23, company: "ioasys", email: "akjd", address: "alk", about: "alksaklsklasklkaslklasklakslkaslksal", registered: Date(timeIntervalSince1970: .zero), tags: ["a", "b"], friends: [Friend(id: UUID(), name: "milpeira")]))
    }
}
