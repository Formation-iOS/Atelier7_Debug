//
//  TabsViewController.swift
//  Films
//
//  Created by Claire Reynaud on 01/11/2017.
//  Copyright © 2017 Claire Reynaud EIRL. All rights reserved.
//

import UIKit

class TabsViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let moviesVC = PopularMoviesViewController()
        let moviesNavigationController = UINavigationController(rootViewController: moviesVC)
        moviesNavigationController.tabBarItem = UITabBarItem(title: "Popular Movies", image: UIImage(named: "movies-list"), selectedImage: UIImage(named: "movies-list-filled"))
        
        let watchListVC = WatchListViewController()
        let watchListNavigationController = UINavigationController(rootViewController: watchListVC)
        watchListNavigationController.tabBarItem = UITabBarItem(title: "Watchlist", image: UIImage(named: "watch-list"), selectedImage: UIImage(named: "watch-list-filled"))
        
        viewControllers = [moviesNavigationController, watchListNavigationController]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if UserAccount.getSessionId() == nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            present(loginVC, animated: true, completion: nil)
        }
    }
}
