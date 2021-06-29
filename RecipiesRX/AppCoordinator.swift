//
//  AppCoordinator.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 27/06/2021.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator]{get set}
    var parent: Coordinator?{get}
    var navigationController: UINavigationController {get}
    func start()
    func dismiss()
}
extension Coordinator{
    func childDidFinish(child: Coordinator){
        if let index = childCoordinators.firstIndex(where: { $0 === child }){
            childCoordinators.remove(at: index)
        }
    }
    
    func dismiss(){
        parent?.childDidFinish(child: self)
    }
}


class AppCoordinator: Coordinator{
    var parent: Coordinator? =  nil
    var navigationController: UINavigationController
    private let window: UIWindow
    
    var childCoordinators: [Coordinator] = []
    
    init(window: UIWindow){
        self.window = window
        navigationController = UINavigationController()
    }
    
    func start(){
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        childCoordinators.append(loginCoordinator)
        loginCoordinator.parent = self
        loginCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
