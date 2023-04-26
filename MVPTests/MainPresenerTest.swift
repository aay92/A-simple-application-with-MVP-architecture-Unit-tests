//
//  MainPresenerTest.swift
//  MVPTests
//
//  Created by Aleksey Alyonin on 26.04.2023.
//

import XCTest
@testable import MVP

class MockView: MainViewProtocol {
    
    var titleTest: String?
    func setGreeting(greenting: String) {
        self.titleTest = greenting
    }
}

final class MainPresenerTest: XCTestCase {

    var view: MockView!
    var person: Person!
    var presenter: MainPresenter!
    
    override func setUpWithError() throws {
        view = MockView()
        person = Person(firstName: "Baz", lastName: "Bar")
        presenter = MainPresenter(view: view, person: person)
    }

    override func tearDownWithError() throws {
        view = nil
        person = nil
        presenter = nil
    }
    func testPerson(){
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "Bar")

    }
}
