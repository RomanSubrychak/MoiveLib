//
//  Genre.swift
//  MovieLib
//
//  Created by Roman Subrichak on 10/2/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import Foundation

enum Genre: Int {
	case action = 28
	case drama = 18
	case family = 10751
	case fantasy = 14
	case history = 36
	case horror = 27
	case music = 10402
	case mystery = 9648
	case romance = 10749
	case scienceFiction = 878
	case tvMovie = 10770
	case thriller = 53
	case war = 10752
	case western = 37
}

extension Genre: CustomStringConvertible {
	var description: String {
		switch self {
		case .action: return "Action"
		case .drama: return "Drama"
		case .family: return "Family"
		case .fantasy: return "Fantasy"
		case .history: return "History"
		case .horror: return "Horror"
		case .music: return "Music"
		case .mystery: return "Mystery"
		case .romance: return "Romance"
		case .scienceFiction: return "Science Fiction"
		case .tvMovie: return "TV Movie"
		case .thriller: return "Thriller"
		case .war: return "War"
		case .western: return "Western"
		}
	}
}
