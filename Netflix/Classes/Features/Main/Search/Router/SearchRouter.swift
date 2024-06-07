//
//  HomeRouter.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import UIKit

protocol SearchConnectable {
  static func start()-> UIViewController
}

class SearchRouter : SearchConnectable {
    
   static func start() -> UIViewController {
        let vc = SearchViewController()
        return vc
    }
    
}
