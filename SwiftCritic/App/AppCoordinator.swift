//
//  AppCoordinator.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/28/26.
//

import SwiftUI

enum AppRoute: Hashable {
    case configuration
    case review
    case result
    case history
}

@Observable
class AppCoordinator {
    var path = NavigationPath()
    
    func navigate(to route: AppRoute) {
        path.append(route)
    }
    
    func goBack() {
        if path.isEmpty {
            return
        }
        
        path.removeLast()
    }
    
    func goHome() {
        path.removeLast(path.count)
    }
}
