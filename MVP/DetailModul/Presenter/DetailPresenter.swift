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
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?)
    func setComment()
}

class DetailPresenter: DetailPresenterProtocol {
    ///DetailPresenter конформит протокол DetailPresenterProtocol
    
    weak var view: DetailViewProtocol?
    var comment: Comment?
    let networkService: NetworkServiceProtocol!
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?) {
        self.view = view
        self.comment = comment
        self.networkService = networkService
    }
    
    func setComment() {
        self.view?.setComment(comment: comment)
    }
    
    
}
