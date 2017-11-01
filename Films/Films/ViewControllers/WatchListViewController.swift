//
//  WatchListViewController.swift
//  Films
//
//  Created by Claire Reynaud on 01/11/2017.
//  Copyright © 2017 Claire Reynaud EIRL. All rights reserved.
//

import Foundation
import MBProgressHUD

class WatchListViewController: MoviesViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Watchlist"
    }
    
    override func fetchMovies() {
        guard let sessionId = UserAccount.getSessionId() else {
            return
        }
        
        let hud = MBProgressHUD.showAdded(to: view, animated: true)

        APIRequestManager.watchListMovies(sessionId: sessionId) { moviesResult in
            if let moviesResult = moviesResult {
                self.movies = moviesResult.results
                self.tableView.reloadData()
            }
            hud.hide(animated: true)
        }
    }
    
}

