//
//  MainViewController.swift
//  MVP
//
//  Created by Aleksey Alyonin on 26.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var greentingLabel: UILabel!
    
    ///presenter не создаем а обьявляем, мы будем передавать его из вне, т.е. создаем инъекцию зависимости снаружи
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didTapButtonAction(_ sender: Any){
        self.presenter.showGreeting()
    }
}

//Binding - типо делигат
extension MainViewController: MainViewProtocol {
    func setGreeting(greenting: String) {
        self.greentingLabel.text = greenting
    }
    
    
}
