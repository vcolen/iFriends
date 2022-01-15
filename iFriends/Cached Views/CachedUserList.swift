//
//  CachedUserList.swift
//  iFriends
//
//  Created by Victor Colen on 14/01/22.
//

import SwiftUI

struct CachedUserList: View {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    private var users: FetchedResults<CachedUser>
    var body: some View {
        List(users, id: \.id) { user in
            NavigationLink {
                DetailCachedUserView(user: user)
            } label: {
                HStack {
                    Image(systemName: "circle.fill")
                        .foregroundColor(user.isActive ? .green : .red)
                    Image(systemName: "person.circle.fill")
                        .font(.largeTitle)
                    Text(user.wrappedName)
                }
            }
        }
        .listStyle(.plain)
    }
}

//struct CachedUserList_Previews: PreviewProvider {
//    static var previews: some View {
//        CachedUserList()
//    }
//}
