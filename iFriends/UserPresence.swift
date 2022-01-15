//
//  UserPresence.swift
//  iFriends
//
//  Created by Victor Colen on 14/01/22.
//

import Foundation

class UserPresence: ObservableObject {
    @Published var isFirstLogin: Bool {
            didSet {
                UserDefaults.standard.set(isFirstLogin, forKey: "isFirstLogin")
            }
        }
        
        init() {
            self.isFirstLogin = UserDefaults.standard.object(forKey: "isFirstLogin") as? Bool ?? true
        }
}
