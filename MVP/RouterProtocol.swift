//
//  RouterProtocol.swift
//  MVP
//
//  Created by Aleksey Alyonin on 29.04.2023.
//

import UIKit
///роутер для всех
protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}


protocol RouterProtocol: RouterMain{
    ///initialViewController - Функия для выбора вью контроллера с которого будет запуск
    func initialViewController()
    func showDetail(comment: Comment?)
    ///popToRoot - возврат на главный вье контроллер
    func popToRoot()
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController?, assemblyBuilder: AssemblyBuilderProtocol?) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createMainModule(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showDetail(comment: Comment?) {
        if let navigationController = navigationController {
            guard let DetailViewController = assemblyBuilder?.createDetailModule(comment: comment, router: self) else { return }
            navigationController.pushViewController(DetailViewController, animated: true) 
        }
    }
    
    func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}

