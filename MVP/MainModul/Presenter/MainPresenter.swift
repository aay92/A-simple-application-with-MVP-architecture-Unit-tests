//
//  MainPresenter.swift
//  MVP
//
//  Created by Aleksey Alyonin on 26.04.2023.
//
import Foundation

protocol MainViewProtocol: AnyObject {
    func setGreeting(greenting: String)
}

protocol MainViewPresenterProtocol: AnyObject {
    ///иницилизатор захватывает ссылку на вью
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}



class MainPresenter: MainViewPresenterProtocol {
    
    let view: MainViewProtocol
    let person: Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greenting: greeting)
    }
    
}
