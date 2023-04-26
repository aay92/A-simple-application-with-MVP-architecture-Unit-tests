//
//  ModuleBuilder.swift
//  MVP
//
//  Created by Aleksey Alyonin on 26.04.2023.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}


class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        ///Внидрение зависимостей (экземпляры создаются не внутри сущностей а снаружи)
        let model = Person(firstName: "David", lastName: "Blaine")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        
        view.presenter = presenter
        
        return view
    }
}
