//
//  File.swift
//  MovieLib
//
//  Created by Roman Subrichak on 10/3/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import Foundation

struct MediaContent: Codable {
	let id: Int
	let title: String
	let posterPath: String
	
	init(id: Int, title: String, posterPath: String) {
		self.id = id
		self.title = title
		self.posterPath = posterPath
	}
	
	enum CodingKeys: String, CodingKey {
		case id
		case title
		case posterPath = "poster_path"
	}
}

extension MediaContent {
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		let id = try container.decode(Int.self, forKey: .id)
		let title = try container.decode(String.self, forKey: .title)
		let posterPath = try container.decode(String.self, forKey: .posterPath)
		
		self.init(id: id, title: title, posterPath: posterPath)
	}
}

extension MediaContent: Equatable {
	static func ==(lhs: MediaContent, rhs: MediaContent) -> Bool {
		guard lhs.id == rhs.id else {
			return false
		}
		guard lhs.title == rhs.title else {
			return false
		}
		guard lhs.posterPath == rhs.posterPath else {
			return false
		}
		return true
	}
	
	
}
