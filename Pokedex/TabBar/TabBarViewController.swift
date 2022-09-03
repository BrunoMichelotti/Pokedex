//
//  TabBarViewController.swift
//  Pokedex
//
//  Created by Bruno Michelotti on 31/08/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        setTabBarItens()
        tabBar.barTintColor = .black
    }
    
    func setTabBarItens() {
        let homeVC = setNavigation(HomeViewController())
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 15, weight: .black)
        homeVC.tabBarItem.image = UIImage(systemName: "house.fill", withConfiguration: symbolConfiguration)
        viewControllers = [homeVC]
        setItens()
        
    }
    
    func setItens(){
        guard let items = tabBar.items else {return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
    
    func setNavigation(_ viewController : UIViewController) -> UINavigationController {
        
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.isNavigationBarHidden = false
        navigation.navigationBar.barStyle = .black
        navigation.navigationBar.tintColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigation.navigationBar.titleTextAttributes = textAttributes
        return navigation
        
    }
    
}



