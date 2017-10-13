//
//  Movie.swift
//  Films
//
//  Created by Claire Reynaud on 13/10/2017.
//  Copyright © 2017 Claire Reynaud EIRL. All rights reserved.
//

import Foundation

class Movie {
    
    let title: String
    let description: String
    let imageName: String
    let landscapeImageName: String
    let rating: Double
    
    public init(title: String, description: String, imageName: String, landscapeImageName: String, rating: Double) {
        self.title = title
        self.description = description
        self.imageName = imageName
        self.landscapeImageName = landscapeImageName
        self.rating = rating
    }
}
