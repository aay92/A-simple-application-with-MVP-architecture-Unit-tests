//
//  MainPresenerTest.swift
//  MVPTests
//
//  Created by Aleksey Alyonin on 26.04.2023.
//

import XCTest
@testable import MVP

class MockView: MainViewProtocol {
    func succes() {
    
    }
    
    func failure(error: Error) {
        
    }
}
///Фейковые сетевой слой
class MockNetworkService: NetworkServiceProtocol {
    var comments: [Comment]!
    
    init(){}
    convenience init(comments: [Comment]?){
        self.init()
        self.comments = comments
    }
    func getComments(completion: @escaping (Result<[MVP.Comment]?, Error>) -> Void) {
        if let comments = comments {
            completion(.success(comments))
        } else {
            let error = NSError(domain: "", code: 777)
            completion(.failure(error))
        }
    }
}

final class MainPresenerTest: XCTestCase {

    var view: MockView!
    var presenter: MainPresenter!
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol!
    var comments = [Comment]()
    
    
    override func setUpWithError() throws {
        let nav = UINavigationController()
        let assembly = AssemblyModuleBuilder()
        router = Router(navigationController: nav, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        view = nil
        networkService = nil
        presenter = nil
    }
    func testGetSuccesComments() {
        let comments = Comment(postId: 1, id:2, name: "Foo", email: "Baz", body: "Bar")
        self.comments.append(comments)
        
        view = MockView()
        networkService = MockNetworkService(comments: self.comments)
        presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        var catchComments: [Comment]?
        
        networkService.getComments { result in
            switch result {
            case .success(let success):
                catchComments = success
            case .failure(let failure):
                print("\(failure)")
            }
        }
        XCTAssertNotEqual(catchComments?.count, 0)
        XCTAssertEqual(catchComments?.count, self.comments.count)
    }
}
