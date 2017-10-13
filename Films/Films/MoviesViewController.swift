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
        
        for i in 0...10 {
            if i % 2 == 0 {
                  movies.append(Movie(title: "Minions", description: "Minions Stuart, Kevin and Bob are recruited by Scarlet Overkill, a super-villain who, alongside her inventor husband Herb, hatches a plot to take over the world.", imageName: "minions", rating: 6.4))
            } else {
                  movies.append(Movie(title: "Guardians of the Galaxy Vol. 2", description: "The Guardians must fight to keep their newfound family together as they unravel the mysteries of Peter Quill's true parentage.", imageName: "guardians", rating: 7.6))
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
            cell.setTitle(movie.title, description: movie.description, rating:movie.rating, imageName: movie.imageName)
            return cell
        }
        return UITableViewCell()
    }
}
