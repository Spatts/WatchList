//
//  MoviesController.swift
//  WatchList
//
//  Created by Steven Patterson on 2/6/17.
//  Copyright © 2017 Steven Patterson. All rights reserved.
//

import Foundation
import CoreData

class MovieController {
    
    static let sharedController = MovieController()
    
    // MARK: - API Handling
    
    let baseURl = URL(string: "https://api.themoviedb.org/3/search/movie?")
    weak var delegate: MovieControllerDelegate?
    
    var movies: [Movie] = [] {
        didSet {
            delegate?.moviesUpdated(movies: movies)
        }
    }
    
    func getMovies(searchTerm: String) {
        guard let url = baseURl else {
            print("No URL Found")
            return
        }
        
        let urlParameters = ["api_key" : "39b3b8ccedabe0c9373ba3b32a814d13", "query" : searchTerm]
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            guard let data = data else {
                print("ERROR: No data Found")
                return
            }
            
            guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: AnyObject],
                let resultsDictionary = jsonDictionary["results"] as? [[String: AnyObject]] else {
                    print("ERROR: Unable to Serialize JSON")
                    return
            }
            
            let movie = resultsDictionary.flatMap {Movie(dictionary: $0)}
            self.movies = movie
            print("SUCCESS!!")
        }
    }
    
    // MARK: - CoreData Functions
    
    func addMovie(title: String, overview: String, rating: Double, poster: NSData) {
        let _ = SavedMovie(title: title)
    }
    
}

// MARK: - Movies Protocol

protocol MovieControllerDelegate: class {
    func moviesUpdated(movies: [Movie])
}
