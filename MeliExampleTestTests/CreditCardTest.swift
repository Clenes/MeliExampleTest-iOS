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
    
    /** PROBLEMA 2
     * Validar la fecha de expiracion con formato MM/yy
     * Validar que la fecha no este expirada
     * Validar que la fecha ya este expirada
     **/
    
}
