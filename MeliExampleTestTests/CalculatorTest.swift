//
//  CalculatorTest.swift
//  MeliExampleTestTests
//
//  Created by Carolain Lenes on 4/11/21.
//

import XCTest
@testable import MeliExampleTest

class CalculatorTest: XCTestCase {
    
    let sut = Calculator()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCalculatorAdd() {
        let addValue = sut.add(numberOne: 4, numberTwo: 3)
        let addExpectation = 7
        XCTAssertEqual(addValue, addExpectation)
    }
    
    func testCalculatorSubstract() {
        let addValue = sut.substract(numberOne: 4, numberTwo: 3)
        let addExpectation = 1
        XCTAssertEqual(addValue, addExpectation)
    }

}
