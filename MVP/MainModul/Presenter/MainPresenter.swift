//
//  MainPresenter.swift
//  MVP
//
//  Created by Aleksey Alyonin on 26.04.2023.
//
import Foundation

///вход/input
protocol MainViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

///выход/output
protocol MainViewPresenterProtocol: AnyObject {
    ///иницилизатор захватывает ссылку на вью
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getComments()
    var comments: [Comment]? { get set }
    func tapOnTheComment(comment: Comment?)
}

class MainPresenter: MainViewPresenterProtocol {
    
    
    var comments: [Comment]?
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol!
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        ///При инициилизации начинаем грузить комменты
        getComments()
    }
    func tapOnTheComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }
    
    func getComments() {
        networkService.getComments {[weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.succes()
                case .failure(let error):
                    print(error)
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
}
