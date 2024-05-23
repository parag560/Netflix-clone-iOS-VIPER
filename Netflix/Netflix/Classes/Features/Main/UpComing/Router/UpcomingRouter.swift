//
//  HomeRouter.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import UIKit

protocol UpcomingConnectable {
  static func start()-> UIViewController
}

class UpcomingRouter : UpcomingConnectable {
    
   static func start() -> UIViewController {
        let vc = UpcomingViewController()
        return vc
    }
    
}
