//
//  ModuleBuilder.swift
//  MVP
//
//  Created by Aleksey Alyonin on 26.04.2023.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailModule(comment: Comment?) -> UIViewController
}


class ModuleBuilder: Builder {
    
    static func createMainModule() -> UIViewController {
        ///Внидрение зависимостей (экземпляры создаются не внутри сущностей а снаружи)
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)

        view.presenter = presenter
        return view
    }


static func createDetailModule(comment: Comment?) -> UIViewController {
    ///Внидрение зависимостей (экземпляры создаются не внутри сущностей а снаружи)
    let view = DetailViewController()
    let networkService = NetworkService()
    let presenter = DetailPresenter(view: view, networkService: networkService, comment: comment)

    view.presener = presenter
    return view
}

}
