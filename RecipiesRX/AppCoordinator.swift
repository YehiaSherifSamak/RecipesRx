//
//  AppCoordinator.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 27/06/2021.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator]{get set}
    var navigationController: UINavigationController {get}
    func start()
}


class AppCoordinator: Coordinator{
    
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
        loginCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
