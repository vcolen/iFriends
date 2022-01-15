//
//  CachedUser+CoreDataProperties.swift
//  iFriends
//
//  Created by Victor Colen on 14/01/22.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tags: String?
    @NSManaged public var cachedFriend: NSSet?
    
    public var wrappedAbout: String {
        about ?? "N/A"
    }
    
    public var wrappedAddress: String {
        address ?? "N/A"
    }
    
    public var wrappedCompany: String {
        company ?? "N/A"
    }
    
    public var wrappedEmail: String {
        email ?? "N/A"
    }
    
    public var wrappedId: UUID {
        id ?? UUID()
    }
    
    public var wrappedName: String {
        name ?? "N/A"
    }
    
    public var wrappedResgitered: Date {
        registered ?? Date.now
    }
    
    public var wrappedTags: String {
        tags ?? "N/A"
    }
    
    public var friendArray: [CachedFriend] {
        let set = cachedFriend as? Set<CachedFriend> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for cachedFriend
extension CachedUser {

    @objc(addCachedFriendObject:)
    @NSManaged public func addToCachedFriend(_ value: CachedFriend)

    @objc(removeCachedFriendObject:)
    @NSManaged public func removeFromCachedFriend(_ value: CachedFriend)

    @objc(addCachedFriend:)
    @NSManaged public func addToCachedFriend(_ values: NSSet)

    @objc(removeCachedFriend:)
    @NSManaged public func removeFromCachedFriend(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
