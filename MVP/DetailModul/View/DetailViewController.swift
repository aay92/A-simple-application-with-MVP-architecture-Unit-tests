//
//  DetailViewController.swift
//  MVP
//
//  Created by Aleksey Alyonin on 28.04.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var commentLAbel: UILabel!
    var presener: DetailPresenterProtocol!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        presener.setComment()
    }
     
    @IBAction func tapAction(_ sender: Any) {
        presener.tap()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        commentLAbel.text = comment?.body
    }
    
    
}
