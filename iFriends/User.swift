//
//  User.swift
//  iFriends
//
//  Created by Victor Colen on 13/01/22.
//

import Foundation

struct User: Codable, Comparable {
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.name == rhs.name
    }
    
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}
