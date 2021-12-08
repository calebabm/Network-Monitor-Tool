//
//  MainViewCell.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/7/21.
//

import SwiftUI

struct MainViewCell<T: View>: View {
    
    var cellData: CellData
    var destination: T
    
    var body: some View {
        ZStack {
//            Color.offWhite
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.offWhite)
                .frame(width: 300, height: 270)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            Section {
                NavigationLink {
                    destination
                } label: {
                    Text(cellData.title)
                        .frame(alignment: .center)
                }
            }
            .frame(width: 300, height: 300, alignment: .center)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainViewCell_Previews: PreviewProvider {
    static var previews: some View {
        let cellData = CellData(title: "Local")
        MainViewCell(cellData: cellData, destination: EmptyView())
            .previewLayout(.fixed(width: 300, height: 300))

    }
}

//SwiftUI(iOS 14) currently doesn't allow most customization of NavigationView, so this is a work around
struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ viewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let navigationController = viewController.navigationController {
            self.configure(navigationController)
        }
    }

}

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}
