//
//  TabBarViewController.swift
//  Runner
//
//  Created by Rosie Arasa on 1/9/22.
//

import UIKit

// understand why final class for mobile

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor.label
        //this function sets up the view controllers
        setupViewControllers()
    }
    
    private func setupViewControllers(){
        viewControllers = [
            createViewControllers(for: HomeViewController(), title: "Run", systemImage: "hare"),
            createViewControllers(for: HistoryViewController(), title: "Logs", systemImage: "clock")
        ]
        
    }
    // help set up the icons and icon tabs and all the other stuff - helper
    private func createViewControllers(for viewController: UIViewController, title: String, systemImage: String) -> UIViewController {
        
        let iconSymbol = UIImage(systemName: systemImage)
        
        let selectedSymbol = UIImage(systemName: systemImage, withConfiguration:  UIImage.SymbolConfiguration(weight: .bold))
        
        let tabBarItem = UITabBarItem(title: title, image: iconSymbol, selectedImage: selectedSymbol)
        viewController.tabBarItem = tabBarItem
        
        return viewController

        
        
    }
}
