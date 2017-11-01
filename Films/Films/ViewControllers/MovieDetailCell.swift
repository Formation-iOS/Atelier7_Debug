//
//  MovieDetailCell.swift
//  Films
//
//  Created by Claire Reynaud on 13/10/2017.
//  Copyright © 2017 Claire Reynaud EIRL. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class MovieDetailCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var watchListButton: UIButton!
    
    var movie: Movie?
    var watchListToggleHandler: ((_ inWatchList: Bool) -> Void)?
    
    func setMovie(_ movie: Movie) {
        self.movie = movie
        movieTitleLabel.text = movie.title
        movieRatingLabel.text = String(format: "Note : %.1f/10", movie.vote_average)
        movieDescriptionLabel.text = movie.overview
        movieImageView.image = nil
        if let url = URL(string: movie.fullBackdropURLString()) {
            movieImageView.af_setImage(withURL: url)
        }
        if (movie.watchlist ?? false) {
            watchListButton.isHidden = true
        } else {
            watchListButton.isHidden = false
            watchListButton.setTitle("Add to watchlist", for: .normal)
        }
    }
    
    func watchListButtonTapped() {
        guard let sessionId = UserAccount.getSessionId(), let movie = movie else {
            return
        }
        
        let hud = MBProgressHUD.showAdded(to: contentView, animated: true)
        APIRequestManager.addToWatchList(movieId: movie.id, sessionId: sessionId) { (error) in
            movie.watchlist = true
            self.watchListToggleHandler?(true)
            hud.hide(animated: true)
        }
    }
}
