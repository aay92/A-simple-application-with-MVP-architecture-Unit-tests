//
//  ModuleBuilder.swift
//  MVP
//
//  Created by Aleksey Alyonin on 26.04.2023.
//

import UIKit

protocol AssemblyBuilderProtocol{
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController
}


class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        ///Внидрение зависимостей (экземпляры создаются не внутри сущностей а снаружи)
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController {
        ///Внидрение зависимостей (экземпляры создаются не внутри сущностей а снаружи)
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, router: router, comment: comment)
        
        view.presener = presenter
        return view
    }
}
