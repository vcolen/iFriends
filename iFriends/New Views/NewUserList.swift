//
//  NewUserList.swift
//  iFriends
//
//  Created by Victor Colen on 14/01/22.
//

import SwiftUI

struct NewUserList: View {
    var users: [User]
    var body: some View {
        List(users, id: \.id) { user in
            NavigationLink {
                DetailNewUserView(user: user)
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
    }
}

//struct NewUserList_Previews: PreviewProvider {
//    static var previews: some View {
//        NewUserList()
//    }
//}
