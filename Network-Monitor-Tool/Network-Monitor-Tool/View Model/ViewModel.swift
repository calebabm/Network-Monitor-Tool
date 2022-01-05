//
//  ViewModel.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import Combine
import SwiftUI

protocol ViewModel: ObservableObject {
    associatedtype Services
    var dependencies: DependencyContainer<Services> { get set }
    init(_ : DependencyContainer<Services>)
}
