//
//  ViewController.swift
//  MovieHunt
//
//  Created by Matias Martinelli on 28/10/2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create Navigation controller for each section
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DetectiveViewController())
        
        //Add a symbol to each controller
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(named: "anonimo")?.resizeTo(size: CGSize(width: 30, height: 30))
        
        //Add a title to each controller
        vc1.title = "Home"
        vc2.title = "Coming Soon"
        vc3.title = "Top Search"
        vc4.title = "Detective"
        
        // Set the color of the icons
        tabBar.tintColor = .label
        
        // Set all the VC
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)

      }

}
