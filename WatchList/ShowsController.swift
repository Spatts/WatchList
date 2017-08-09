//
//  ShowsController.swift
//  WatchList
//
//  Created by Steven Patterson on 2/6/17.
//  Copyright © 2017 Steven Patterson. All rights reserved.
//

import Foundation

class ShowController {
    let baseURL = URL(string: "https://api.themoviedb.org/3/search/tv?")
    static let sharedController = ShowController()
    weak var delegate: ShowControllerDelegate?
    
    var shows: [Show] = [] {
        didSet {
            delegate?.showsUpdated(Shows: shows)
        }
    }
    
    func getShow(searchTerm: String) {
        guard let url = baseURL else {
            print("ERROR: No URl Found")
            return
        }
        
        let urlParameters = ["api_key": "39b3b8ccedabe0c9373ba3b32a814d13", "query": searchTerm]
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            guard let data = data else {
                print("ERROR: No Data Found")
                return
            }
            
            guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: AnyObject],
                let resultsDictionary = jsonDictionary["results"] as? [[String: AnyObject]] else {
                    print("ERROR: Unable to Serialize JSON")
                    return
            }
            
            let show = resultsDictionary.flatMap {Show(dictionary: $0)}
            self.shows = show
            print("SUCCESS!")
        }
    }
}

protocol ShowControllerDelegate: class {
    func showsUpdated(Shows: [Show])
}
