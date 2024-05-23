//
//  HomeRouter.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import UIKit
typealias EntryPoint = HomeView & UIViewController

protocol HomeConnectable {
    var entry: EntryPoint? {get}
  static func start()-> HomeConnectable
}

class HomeRouter : HomeConnectable {
    var entry: EntryPoint?
    
    
   static func start() -> HomeConnectable {
       let router = HomeRouter()
        let vc = HomeViewController()
       
       var view : HomeView = HomeViewController()
       var presenter : HomePresentable = HomePresenter()
       var interacter : HomeInteractable = HomeInterarcter()
       
       view.presenter = presenter
       interacter.homePresenter = presenter
       
       presenter.view = view
       presenter.interacter = interacter
       
       router.entry = view as? EntryPoint
        return router
    }
    
}
