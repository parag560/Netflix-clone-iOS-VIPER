//
//  TabBarBuilder.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import UIKit



class TabBarBuilder  {
    
    func start() -> [UIViewController] {
        let homeRouter = HomeRouter.start()
        let vc1 = UINavigationController(rootViewController: homeRouter.homeEntry!)
        vc1.tabBarItem.image = UIImage(systemName: "house")
        
        let upcomingRouter = UpcomingRouter.start()
        let vc2 = UINavigationController(rootViewController: upcomingRouter.UpcomingentryPoint!)
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        
        let vc3 = UINavigationController(rootViewController: SearchRouter.start())
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        let vc4 = UINavigationController(rootViewController: DownloadRouter.start())
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        vc1.title = "Home"
        vc2.title = "Upcoming"
        vc3.title = "Search"
        vc4.title = "Downloads"
        
        return [vc1,vc2,vc3,vc4]
    }
    
    
}
