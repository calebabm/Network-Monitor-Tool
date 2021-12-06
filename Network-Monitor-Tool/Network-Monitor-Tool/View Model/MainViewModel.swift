//
//  MainViewModel.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI

final class MainViewModel: ViewModel {
    typealias Services = CoordinatorService
    var dependencies: DependencyContainer<Services>
    var cellData = [
        CellData(title: "Local"),
        CellData(title: "HTTP")
    ]
    
    @ViewBuilder
    func selected(cell: CellData) -> some View {
        if cell.id == cellData[0].id {
            dependencies.services.presentView(with:LocalViewModel(.dependencies((NetworkService(), CoordinatorService()))))
        } else {
            dependencies.services.presentView(with: InternetViewModel(.dependencies((NetworkService(), CoordinatorService()))))
        }
    }
    
    required init(_ dependencies: DependencyContainer<Services>) {
        self.dependencies = dependencies
    }
}

//func constructDependencies(selection: CellData) -> DependencyContainer< {
//
//}


//    func createButton<T: View>(_ buttonType: ButtonTypes<T>, managedState: Binding<Bool> ) -> some View {
//        return Section {
//            NavigationLink(
//                buttonType.details.title,
//                destination: buttonType.details.view,
//                isActive: managedState
//            )
//        }
//    }
//
//    enum ButtonTypes<T> {
//        case local(view: T)
//        case internet(view: T)
//
//        var details: (view: T, title: String) {
//            switch self {
//            case .local(let view):
//                return (view, "Local")
//            case .internet(let view):
//                return (view, "Internet")
//            }
//        }
//    }
