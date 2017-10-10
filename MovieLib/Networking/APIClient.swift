//
//  APIClient.swift
//  MovieLib
//
//  Created by Roman Subrichak on 10/7/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import Foundation
import Alamofire

struct APIClient {
	
	private let api_key = "b7929912e7cd854268c7e5183de4427b"
	
 	let baseURLString = "https://api.themoviedb.org/3"
	
	let imageURLString = "https://image.tmdb.org/t/p/w370_and_h556_bestv2"
	
	func buildImageDataURL(from path: String) -> URL? {
		let urlString = imageURLString.appending(path)
		return URL(string: urlString)
	}
	
	func buildUrl(for contentType: MediaContentType, from category: Category) -> URL? {
		let path = "/\(contentType.rawValue)/\(category.rawValue)?api_key=\(api_key)"
		let destinationUrlString = baseURLString.appending(path)
		return URL(string: destinationUrlString)
	}

	
	func loadData(for contentType: MediaContentType, from category: Category, completion: @escaping ([MediaContent]?) -> Void) {
		guard let url = buildUrl(for: contentType, from: category) else {
			completion(nil)
			return
		}
		
		Alamofire.request(url).validate().responseJSON { response in
			guard response.result.isSuccess,
			let value = response.result.value as? [String: Any],
			let results = value["results"] as? [[String: Any]] else {
				completion(nil)
				return
			}
			
			let decoder = JSONDecoder()
		
			if let data = try? JSONSerialization.data(withJSONObject: results),
				let items = try? decoder.decode([MediaContent].self, from: data) {
				completion(items)
			} else {
				completion(nil)
			}
		}
	}
	
	func loadImageData(from posterPath: String, completion: @escaping (Data?) -> Void) {
		guard let imageUrl = buildImageDataURL(from: posterPath) else {
			completion(nil)
			return
		}
		Alamofire.request(imageUrl).validate().responseData { response in
			response.result.ifSuccess {
				guard let data = response.result.value else {
					completion(nil)
					return
				}
				completion(data)
			}
			response.result.ifFailure {
				completion(nil)
			}
		}
	}
}


