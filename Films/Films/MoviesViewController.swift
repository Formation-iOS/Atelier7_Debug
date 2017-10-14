//
//  MoviesViewController.swift
//  Films
//
//  Created by Claire Reynaud on 12/10/2017.
//  Copyright © 2017 Claire Reynaud EIRL. All rights reserved.
//

import UIKit

class MoviesViewController: UITableViewController {

    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MoviesResult.movieList { moviesResult in
            if let moviesResult = moviesResult {
                self.movies = moviesResult.results
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell {
            cell.setTitle(movie.title, description: movie.overview, rating:movie.vote_average, imageName: movie.fullPosterURLString())
            return cell
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "detailSegue" {
            return
        }
        
        guard let moviedDetailVC = segue.destination as? MovieDetailViewController else {
            return
        }
        
        guard let selectedRow = tableView.indexPathForSelectedRow?.row  else {
            return
        }
        
        moviedDetailVC.movie = movies[selectedRow]
    }
}
