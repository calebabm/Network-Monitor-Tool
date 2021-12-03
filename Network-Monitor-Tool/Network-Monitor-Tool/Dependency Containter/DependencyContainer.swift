//
//  DependencyContainer.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import Foundation

enum DependencyContainer<T> {
    case dependencies(_ services: T)
    
    func construct() {}
    
    var services: T {
        switch self {
        case .dependencies(let services):
            return services
        }
    }
}
