//
//  APIClientTests.swift
//  MovieLibTests
//
//  Created by Roman Subrichak on 10/4/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import XCTest
@testable import MovieLib

class APIClientTests: XCTestCase {
	
	var sut: APIClient!
    
    override func setUp() {
        super.setUp()
		sut = APIClient()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
	}
	
	func test_APIClient_HasBaseURLString() {
		XCTAssertEqual(sut.baseURLString, "https://api.themoviedb.org/3")
	}
	
	func test_buildURL_ForMoviesFromPopular_BuildsUrlForMoviesFromPopular() {
		checkURL(contentType: .movie, category: .popular, urlString: "https://api.themoviedb.org/3/movie/popular?api_key=b7929912e7cd854268c7e5183de4427b")
	}
	
	func test_buildURL_ForMoviesFromLatest_BuildsUrlForMoviesFromLatest() {
		checkURL(contentType: .movie, category: .latest, urlString: "https://api.themoviedb.org/3/movie/latest?api_key=b7929912e7cd854268c7e5183de4427b")
	}
	
	func checkURL(contentType: MediaContentType, category: MovieLib.Category, urlString: String) {
		let url = sut.buildUrl(for: contentType, from: category)
		let expectedURL = URL(string: urlString)
		XCTAssertEqual(url, expectedURL)
	}
	
	func test_LoadData_LoadsMoviesFromPopular_GreaterThanZero() {
	
		var fetchedMovies: [MediaContent]?
	
		let fetchDataExpectation = expectation(description: "loadData")
		sut.loadData(for: .movie, from: .popular) { movies in
			fetchedMovies = movies
			fetchDataExpectation.fulfill()
		}
		
		waitForExpectations(timeout: 3) { _ in
			let count = fetchedMovies?.count ?? 0
			XCTAssertTrue(count > 0)
	
		}
	}
	
	func test_BuildImageDataURL_ReturnsURL() {
		let expectedUrl = URL(string: "https://image.tmdb.org/t/p/w370_and_h556_bestv2/9E2y5Q7WlCVNEhP5GiVTjhEhx1o.jpg")!
		let url = sut.buildImageDataURL(from: "/9E2y5Q7WlCVNEhP5GiVTjhEhx1o.jpg" )!
		XCTAssertEqual(url, expectedUrl)
	}
	
	func test_LoadImageDataWhenPosterPathGiven_LoadsData() {
		let expectations = expectation(description: "LoadImageData")
		
		var imageData: Data?
		
		sut.loadImageData(from: "/9E2y5Q7WlCVNEhP5GiVTjhEhx1o.jpg") { data in
			imageData = data
			expectations.fulfill()
		}
		waitForExpectations(timeout: 3) { _ in
			XCTAssertNotNil(imageData)
		}
	}
}
