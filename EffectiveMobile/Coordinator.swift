//
//  Coordinator.swift
//  EffectiveMobile
//
//  Created by Egor SAUSHKIN on 12.12.2022.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func pushDetailsVC() {
        let vc = DetailsViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func pushCartVC() {
        let vc = CartViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
