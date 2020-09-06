//
//  testUserSettingsViewModel.swift
//  modes-mobile-iosUITests
//
//  Created by yada on 8/20/20.
//

import XCTest

class testUserSettingsViewModel: XCTestCase, WebServiceConnectorDelegate {
    func onError(_ apiError: Error) {
        
    }
    
    func onSuccess(_ jsonString: String) {
        print(jsonString)
    }
    

    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetInstallations() throws {
        
        
        let viewModel : UserSettingsViewModel?
        
        viewModel = UserSettingsViewModel()
        viewModel?.getInstallations()
        
        let apiExpectation = expectation(description: "apicall")
        wait(for: [apiExpectation], timeout: 10)
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    

}

