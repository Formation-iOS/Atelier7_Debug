//
//  MovieDetailViewController.swift
//  Films
//
//  Created by Claire Reynaud on 13/10/2017.
//  Copyright © 2017 Claire Reynaud EIRL. All rights reserved.
//

import UIKit

class MovieDetailViewController: UITableViewController {
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 361
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = movie.title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailCell", for: indexPath) as? MovieDetailCell {
            cell.setTitle(movie.title, description: movie.overview, rating:movie.vote_average, landscapeImageName: movie.fullBackdropURLString())
            return cell
        }
        return UITableViewCell()
    }
}
