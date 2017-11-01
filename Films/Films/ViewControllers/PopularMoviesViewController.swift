//
//  PopularMoviesViewController.swift
//  Films
//
//  Created by Claire Reynaud on 01/11/2017.
//  Copyright © 2017 Claire Reynaud EIRL. All rights reserved.
//

import Foundation
import MBProgressHUD

class PopularMoviesViewController: MoviesViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Popular Movies"
    }
    
    override func fetchMovies() {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        
        APIRequestManager.popularMovies { moviesResult in
            if let moviesResult = moviesResult {
                self.movies = moviesResult.results
                self.tableView.reloadData()
            }
            hud.hide(animated: true)
        }
    }
}
