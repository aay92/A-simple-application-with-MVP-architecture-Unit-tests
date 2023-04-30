//
//  DetailPresenter.swift
//  MVP
//
//  Created by Aleksey Alyonin on 28.04.2023.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
}

protocol DetailPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?)
    func setComment()
    func tap()
}

class DetailPresenter: DetailPresenterProtocol {
    
    ///DetailPresenter конформит протокол DetailPresenterProtocol
    
    weak var view: DetailViewProtocol?
    var comment: Comment?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol!
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?) {
        self.view = view
        self.comment = comment
        self.router = router
        self.networkService = networkService
    }
    
    func setComment() {
        self.view?.setComment(comment: comment)
    }
    func tap() {
        router?.popToRoot()
    }
}
