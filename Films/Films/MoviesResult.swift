//
//  MoviesResult.swift
//  Films
//
//  Created by Claire Reynaud on 14/10/2017.
//  Copyright © 2017 Claire Reynaud EIRL. All rights reserved.
//

import Foundation
import Alamofire

class MoviesResult: NSObject, Codable {
    var results = [Movie]()
    
    static func movieList(result: @escaping (MoviesResult?) -> Void) {
        Alamofire.request("https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=b692eafd258dae823a2d9ed21dbcdeb5").responseJSON { response in
            if let error = response.result.error {
                print(error)
                result(nil)
            } else {
                if let data = response.data {
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    do {
                        let moviesResult = try decoder.decode(MoviesResult.self, from: data)
                        result(moviesResult)
                    } catch let error {
                        print("Cannot decode: error during decode: \(error)")
                        result(nil)
                    }
                } else {
                    print("Cannot decode: no data")
                    result(nil)
                }
            }
        }
    }
}
