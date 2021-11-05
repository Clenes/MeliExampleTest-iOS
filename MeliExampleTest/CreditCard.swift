//
//  CreditCard.swift
//  MeliExampleTest
//
//  Created by Carolain Lenes on 4/11/21.
//

import Foundation

class CreditCard {
    
    let format = "**** **** **** "
    let digitsSize = 16
    let cvvSize = 3
    
    var cvv: Int? = nil
    
    var digits: String? = nil
    
    func cleanState() {
            print("clean state - done! $this")
    }
    
    func setCVV(securityCode: String) -> Bool {
        
        guard securityCode.count == cvvSize else {
            return false
        }
        
        guard let numbers = Int(securityCode) else {
            return false
        }
        
        self.cvv = numbers
        
        return cvv != nil
    }
    
    func setDigits(value: String) -> Bool {
        
        guard value.count <= digitsSize else {
            return false
        }
        
        guard let _ = Int(value) else {
            return false
        }
        
        digits = "\(format)\(value.suffix(4))"
        
        return digits != nil
    }
    
    func setExpirationDate(date: String) -> Bool {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/yy"
        guard let enteredDate = dateFormatter.date(from: date) else {
            return false
        }
        let endOfMonth = Calendar.current.date(byAdding: .month, value: 1, to: enteredDate)! // Se le suma un mes a la fecha ingresada
        let currentDate = Date()
        var validDate: Bool = false
        if (endOfMonth > currentDate) {
            validDate = true
        }
        return validDate
    }
    
    
}
