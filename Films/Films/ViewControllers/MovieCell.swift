//
//  MovieCell.swift
//  Films
//
//  Created by Claire Reynaud on 13/10/2017.
//  Copyright © 2017 Claire Reynaud EIRL. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    func setMovie(_ movie: Movie) {
        movieTitleLabel.text = movie.title
        movieRatingLabel.text = String(format: "Note : %.1f/10", movie.vote_average)
        movieDescriptionLabel.text = movie.overview
        if let url = URL(string: movie.fullPosterURLString()) {
            movieImageView.af_setImage(withURL: url)
        }
    }
}
