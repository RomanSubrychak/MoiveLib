//
//  FeaturedViewControllerTests.swift
//  MovieLibTests
//
//  Created by Roman Subrichak on 10/1/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import XCTest
import UIKit
@testable import MovieLib

class FeaturedViewControllerTests: XCTestCase {
	
	var sut: FeaturedViewController!
    
    override func setUp() {
        super.setUp()
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		sut = storyboard.instantiateViewController(withIdentifier: "FeaturedViewController") as! FeaturedViewController
		
		_ = sut.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	func test_ViewController_HasSegmentedControl() {
		XCTAssertNotNil(sut.segmentedControl)
	}
	func test_Title_EqualFeatured() {
		XCTAssertEqual(sut.title, "Featured" )
	}
	
	func test_HasTableView() {
		XCTAssertNotNil(sut.tableView)
	}
	func test_TableView_HasTableHeaderView() {
		XCTAssertNotNil(sut.tableView.tableHeaderView)
	}
	func test_TableHeaderViewWidth_EqualViewWidth() {
		XCTAssertEqual(sut.tableView.tableHeaderView?.frame.width, sut.tableView.frame.size.width)
	}
	func test_TableHeaderViewHeight_TwoHundred() {
		XCTAssertEqual(sut.tableView.tableHeaderView?.frame.height, 200)
	}
}
