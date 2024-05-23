//
//  TabViewController.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import UIKit

class TabViewController: UITabBarController {
    var builder = TabBarBuilder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewControllers = builder.start()
        self.setViewControllers(viewControllers, animated: true)
        tabBar.tintColor = .label
        tabBar.unselectedItemTintColor = .gray
    }
    
}
