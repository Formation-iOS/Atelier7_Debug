//
//  MovieDetailCell.swift
//  Films
//
//  Created by Claire Reynaud on 13/10/2017.
//  Copyright © 2017 Claire Reynaud EIRL. All rights reserved.
//

import UIKit
import Alamofire

class MovieDetailCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    func setTitle(_ title: String, description: String, rating: Double, landscapeImageName: String) {
        movieTitleLabel.text = title
        movieRatingLabel.text = String(format: "Note : %.1f/10", rating)
        movieDescriptionLabel.text = description
        movieImageView.image = nil
        if let url = URL(string: landscapeImageName) {
            movieImageView.af_setImage(withURL: url)
        }
    }
}
