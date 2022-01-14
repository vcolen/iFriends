//
//  iFriendsApp.swift
//  iFriends
//
//  Created by Victor Colen on 13/01/22.
//

import SwiftUI

@main
struct iFriendsApp: App {
    @StateObject private var dataContoller = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataContoller.container.viewContext)
        }
    }
}
