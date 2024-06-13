//
//  HomeRouter.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import UIKit

protocol DownloadConnectable {
  static func start()-> UIViewController
}

class DownloadRouter : DownloadConnectable {
    
   static func start() -> UIViewController {
        let vc = DownloadViewController()
        return vc
    }
    
}
