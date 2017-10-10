//
//  MediaContentTests.swift
//  MovieLibTests
//
//  Created by Roman Subrichak on 10/3/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import XCTest
@testable import MovieLib

class MediaContentTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	func test_Init_WhenGivenIdAndTitleAndPosterPath() {
		_ = MediaContent(id: 123, title: "Foo", posterPath: "Bar")
	}
	
	func test_Init_WhenGivenIdAndTitleAndPoster() {
		let content = MediaContent(id: 123, title: "Foo", posterPath: "Bar")
		XCTAssertEqual(content.id, 123)
		XCTAssertEqual(content.title, "Foo")
		XCTAssertEqual(content.posterPath, "Bar")
	}

	func test_MediaContentWhenIdDiffers_AreNotEqual() {
		let item1 = MediaContent(id: 123, title: "Foo", posterPath: "Bar")
		let item2 = MediaContent(id: 321, title: "Foo", posterPath: "Bar")
		XCTAssertNotEqual(item1, item2)
	}
	
	func test_MediaContentWhenTitleDiffers_AreNotEqual() {
		let item1 = MediaContent(id: 123, title: "Foo", posterPath: "Bar")
		let item2 = MediaContent(id: 123, title: "Baz", posterPath: "Bar")
		XCTAssertNotEqual(item1, item2)
	}
	
	func test_MediaContentWhenPosterPathDiffers_AreNotEqual() {
		let item1 = MediaContent(id: 123, title: "Foo", posterPath: "Bar")
		let item2 = MediaContent(id: 321, title: "Foo", posterPath: "Baz")
		XCTAssertNotEqual(item1, item2)
	}
	
	func test_MediaContent_DecodeInstance_DecodesInstance() {
		let encoder = JSONEncoder()
		let mediaContent = MediaContent(id: 123, title: "Foo", posterPath: "Bar")
		var decodedInstanse =  MediaContent(id: 1, title: "", posterPath: "")
		if let encodedInstanse = try? encoder.encode(mediaContent) {
			let decoder = JSONDecoder()
			if let decoded = try? decoder.decode(MediaContent.self, from: encodedInstanse) {
				decodedInstanse = decoded
			}
		}
		XCTAssertEqual(mediaContent, decodedInstanse)
	}
	func test_MediaContentDecodedFromDictionary_DecodesInstance() {
		let dictionary = ["id":123,"title": "Foo", "poster_path":"Bar"] as [String : Any]
		if let data = try? JSONSerialization.data(withJSONObject: dictionary) {
			let decoder = JSONDecoder()
			let expectedItem = MediaContent(id: 123, title: "Foo", posterPath: "Bar")
			if let item = try? decoder.decode(MediaContent.self, from: data) {
				XCTAssertEqual(item, expectedItem)
			} else {
				XCTFail()
			}
		} else {
			XCTFail()
		}
		
		
	}
}

