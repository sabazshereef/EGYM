//
//  EGYMTests.swift
//  EGYMTests
//
//  Created by sabaz shereef on 19/06/21.
//

import XCTest
@testable import EGYM

class EGYMTests: XCTestCase {
let mockApiCall = MockApiCall()

    var vc = ViewController()
    let dt = TopStoriesDataSource()
    
    override func setUpWithError() throws {

       
       
      vc = ViewController(nibName: "TopStoriesView", bundle: nil)
        _ = vc.view
        
        
    }
    
    func testCustomViewContainsAView() {
       let bundle = Bundle(for: TopListingTableCell.self)
       guard let _ = bundle.loadNibNamed("TopListingTableCell", owner: nil)?.first as? UIView else {
           return XCTFail("CustomView nib did not contain a UIView")
        }
     }
    func testCustomCell() {
        let customCell: TopListingTableCell = vc.topListTable.dequeueReusableCell(withIdentifier: "cell") as! TopListingTableCell
       XCTAssertNotNil(customCell, "No Custom Cell Available")
     }
   
    func testHasATableView() {
       
        XCTAssertNotNil(vc.topListTable)
    }
    func testTableViewHasDelegate() {
        XCTAssertNotNil(vc.topListTable.delegate)
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(vc.dataSource)
    }
    
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(dt.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(dt.responds(to: #selector(dt.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(dt.responds(to: #selector(dt.tableView(_:cellForRowAt:))))
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
//MARK:- API test -
    
    
    
    
    func testApiCall() {
        let exp = expectation(description: "Waiting for the upcoming event Api  to complete.")

         mockApiCall.fetchingDataFromApi { result in

            switch result {
            case .success(let topStories) :
                // reload data
                XCTAssertNotNil(topStories)
                exp.fulfill()

                break
            case .failure(let error) :
                XCTAssertNil(error.localizedDescription)
                XCTFail()
                break
            
           

            }
        
        }
       
        wait(for: [exp], timeout: 10.0)
     
}
}
