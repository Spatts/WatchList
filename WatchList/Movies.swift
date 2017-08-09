//
//  Movies.swift
//  WatchList
//
//  Created by Steven Patterson on 2/6/17.
//  Copyright © 2017 Steven Patterson. All rights reserved.
//

import Foundation

struct Movie {
    
    private let kTitle = ""
    private let kOverview = ""
    private let kRating = ""
    private let kPoster = ""
    
    let title: String
    let overview: String
    let rating: Double
    let poster: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let title = dictionary[kTitle] as? String,
            let overview = dictionary[kOverview] as? String,
            let rating = dictionary[kRating] as? Double,
            let poster = dictionary[kPoster] as? String else {return nil}
        
        self.title = title
        self.overview = overview
        self.rating = rating
        self.poster = poster
    }
    
}
