//
//  MoviesViewController.swift
//  Films
//
//  Created by Claire Reynaud on 12/10/2017.
//  Copyright © 2017 Claire Reynaud EIRL. All rights reserved.
//

import UIKit
import MBProgressHUD

class MoviesViewController: UITableViewController {

    private static let cellId = "MovieCell"
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: MoviesViewController.cellId)
        
        fetchMovies()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: MoviesViewController.cellId, for: indexPath) as? MovieCell {
            cell.setMovie(movie)
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let movie = movies[indexPath.row]
        
        if let sessionId = UserAccount.getSessionId() {
            let hud = MBProgressHUD.showAdded(to: view, animated: true)
            
            APIRequestManager.isInWatchList(movieId: movie.id, sessionId: sessionId, result: { (watchlist, error) in
                movie.watchlist = watchlist
                hud.hide(animated: true)
                self.showDetailForMovie(movie)
            })
        }
    }
    
    private func showDetailForMovie(_ movie: Movie) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let movieDetailVC = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController {
            movieDetailVC.movie = movie
            navigationController?.pushViewController(movieDetailVC, animated: true)
        }
    }
    
    func fetchMovies() {
    }
}
