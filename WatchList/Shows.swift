//
//  Shows.swift
//  WatchList
//
//  Created by Steven Patterson on 2/6/17.
//  Copyright © 2017 Steven Patterson. All rights reserved.
//

import Foundation

struct Show {
    
    private let kTitle = "name"
    private let kRating = "vote_average"
    private let kOverview = "overview"
    private let kPoster = "poster_path"
    
    var title: String
    var rating: Double
    var overview: String
    var poster: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let title = dictionary[kTitle] as? String,
            let rating = dictionary[kRating] as? Double,
            let overview = dictionary[kOverview] as? String,
            let poster = dictionary[kPoster] as? String else {return nil}
        
        self.title = title
        self.rating = rating
        self.overview = overview
        self.poster = poster
    }
}
