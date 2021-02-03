//
//  IOCContainerFrameworkTests.swift
//  IOCContainerFrameworkTests
//
//  Created by Julio Reyes on 2/1/21.
//

import XCTest
@testable import IOCContainerFramework

class BankAccount {

    var accountBalance: Float
    var accountNumber: Int

    init(number: Int, balance: Float)
    {
        accountNumber = number
        accountBalance = balance
    }

    func displayBalance()
    {
       print("Number \(accountNumber)")
       print("Current balance is \(accountBalance)")
    }
}

class SavingsAccount: BankAccount {

    var interestRate: Float = 0.0
    
    init(number: Int, balance: Float, rate: Float)
    {
        interestRate = rate
        super.init(number: number, balance: balance)
    }

    func calculateInterest() -> Float
    {
        return interestRate * accountBalance
    }

    override func displayBalance()
    {
       print("Number \(accountNumber)")
       print("Current balance is \(accountBalance)")
       print("Prevailing interest rate is \(interestRate)")
    }
}

class IOCContainerFrameworkTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        // Create directories
        do {
            
            let testAccount: BankAccount = BankAccount.init(number: Int.random(in: 0...10), balance: Float.random(in: 0...1000))
            let testSavingsAccount: SavingsAccount =  SavingsAccount.init(number: testAccount.accountNumber, balance: testAccount.accountBalance, rate: 0.05)
            
            
            IOCContainerFramework.register(testAccount)
            IOCContainerFramework.register(testSavingsAccount)
        } catch {
            print("ERROR: Dependency Directory Creation Failed: Status: Calamitous : \(error.localizedDescription)")
        }
        
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
