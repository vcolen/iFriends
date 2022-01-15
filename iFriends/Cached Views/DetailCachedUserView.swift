//
//  DetailCachedUserView.swift
//  iFriends
//
//  Created by Victor Colen on 14/01/22.
//

import SwiftUI

struct DetailCachedUserView: View {
    var user: CachedUser
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text(user.wrappedName.capitalized)
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
                    
                Text(user.wrappedAbout)
                    
                Text("More Info")
                        .font(.title.bold())
                        .padding([.bottom, .top], 10)
                    Text("\(user.wrappedName.capitalized) is \(user.age) and works @\(user.wrappedCompany).")
                }
                
                HStack {
                    Spacer()
                    Text("Member since \(user.wrappedResgitered.formatted(date: .abbreviated, time: .omitted))")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.trailing)
                    .padding(.bottom, 30)
                }
                    
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(user.friendArray, id: \.id) { friend in
                        VStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 100, height: 100)
                            Text(friend.wrappedName.capitalized)
                        }
                    }
                }
            }
        }
        .navigationTitle("Person Info")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct DetailCachedUserView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailCachedUserView()
//    }
//}
