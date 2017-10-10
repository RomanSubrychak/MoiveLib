//
//  Category.swift
//  MovieLib
//
//  Created by Roman Subrichak on 10/4/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import Foundation

enum Category: String {
	case latest
	case nowPlaying = "now_playing"
	case popular
	case topRated = "top_rated"
	case upcoming
	case airingToday = "airing_today"
	case onTheAir = "on_the_air"
}

extension Category: CustomStringConvertible {
	var description: String {
		switch self {
		case .latest: return "Latest"
		case .nowPlaying: return "Now Playing"
		case .popular: return "Popular"
		case .topRated: return "Top Rated"
		case .upcoming: return "Upcoming"
		case .airingToday: return "Airing Today"
		case .onTheAir: return "On The Air"
		}
	}
}
