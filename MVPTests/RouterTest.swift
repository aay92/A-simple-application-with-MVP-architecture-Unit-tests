//
//  RouterTest.swift
//  MVPTests
//
//  Created by Aleksey Alyonin on 30.04.2023.
//

import XCTest
@testable import MVP

class MockNavigationController: UINavigationController {
    var presemterVC: UIViewController?
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presemterVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

class RouterTest: XCTestCase {

    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let assembly = AssemblyModuleBuilder()
    
    override func setUpWithError() throws {
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
      router = nil
    }
    
    func testRouter() {
        router.showDetail(comment: nil)
        let detailViewController = navigationController.presemterVC
        ////XCTAssertTrue(detailViewController is DetailViewController) реально ли это этот вью контроллер
        XCTAssertTrue(detailViewController is DetailViewController)
    }
}
