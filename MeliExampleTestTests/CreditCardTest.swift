//
//  CreditCardTest.swift
//  MeliExampleTestTests
//
//  Created by Carolain Lenes on 4/11/21.
//

import XCTest
@testable import MeliExampleTest

class CreditCardTest: XCTestCase {
    
    private var creditCard: CreditCard!
    
    override func setUpWithError() throws {
        creditCard = CreditCard()
    }
    
    override func tearDownWithError() throws {
        creditCard.cleanState()
    }
    
    func testCheckCvvSizeCorrect() {
        let result = creditCard.setCVV(securityCode: "123")
        
        XCTAssertTrue(result)
        XCTAssertNotNil(creditCard.cvv)
    }
    
    func testCheckCvvSizeIncorrect() {
        let result = creditCard.setCVV(securityCode: "12")
        
        XCTAssertFalse(result)
    }
    
    func testCheckCvvCharacterNotNumeric() {
        let result = creditCard.setCVV(securityCode: "1S2")
        
        XCTAssertFalse(result)
    }
    
    
    /** PROBLEMA 1
     * Validar MAX 16 dígitos
     * Validar que solo sean numéricos
     * Validar que el lo guardado en CreditCard.digit sea
     el formato: **** **** **** 1234 (siendo 1234 los ultimos dígitos de la tarjeta)
     **/
    
    
    func testMaxCount() {
        let maxCount = creditCard.setDigits(value: "12345678901234567")
        XCTAssertFalse(maxCount)
    }
    
    func testCheckDigitsCharacterNotNumeric() {
        let result = creditCard.setDigits(value: "123456789012345A")
        
        XCTAssertFalse(result)
    }
    
    func testCheckDigitsFormat() {
        let expectation = "**** **** **** 3456"
        creditCard.setDigits(value: "1234567890123456")
        let result = creditCard.digits
        XCTAssertEqual(expectation, result)
    }
    
    
    /** PROBLEMA 2
     * Validar la fecha de expiracion con formato MM/yy
     * Validar que la fecha no este expirada
     * Validar que la fecha ya este expirada
     **/
    
    
    func testFormatExpirationDate() {
        let expirationDate = creditCard.setExpirationDate(date: "06/19/3434343")
        XCTAssertFalse(expirationDate)
    }
    func testNoExpirationDate() {
        let expirationDate = creditCard.setExpirationDate(date: "12/21")
        XCTAssertTrue(expirationDate)
    }
    // ya experiró
    func testExpirationDate() {
        let expirationDate = creditCard.setExpirationDate(date: "06/19")
        XCTAssertFalse(expirationDate)
    }
    
}
