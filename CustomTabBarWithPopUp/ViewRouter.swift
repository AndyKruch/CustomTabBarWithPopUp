//
//  ViewRouter.swift
//  CustomTabBarWithPopUp
//
//  Created by Andy Kruch on 08.11.23.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentItem: TabBarViewModel = .home
    
    var view: some View { return currentItem.view}
}

enum TabBarViewModel: Int, CaseIterable {
    case home
    case search
    case notifications
    case account
    
    var imageName: String {
        switch self {
        case .home: return "house.fill"
        case .search: return "magnifyingglass"
        case .notifications: return "bell.fill"
        case .account: return "person.fill"
        }
    }
    
    var view: some View {
        switch self {
        case .home:
            return Text("Home")
        case .search:
            return Text("Search")
        case .notifications:
            return Text("Notifications")
        case .account:
            return Text("Account")
            
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .notifications:
            return "Notify"
        case .account:
            return "Account"
            
        }
    }
}
