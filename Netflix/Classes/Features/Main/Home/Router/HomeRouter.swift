//
//  HomeRouter.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import UIKit
typealias EntryPoint = HomeView & UIViewController

protocol HomeConnectable {
    var homeEntry: EntryPoint? {get}
  static func start()-> HomeConnectable
}

class HomeRouter : HomeConnectable {
    var homeEntry: EntryPoint?
    
    
   static func start() -> HomeConnectable {
       let router = HomeRouter()
       
       var view : HomeView = HomeViewController()
       var presenter : HomePresentable = HomePresenter()
       var interacter : HomeInteractable = HomeInterarcter()
       
       view.presenter = presenter
       interacter.homePresenter = presenter
       
       presenter.view = view
       presenter.interacter = interacter
       
       router.homeEntry = view as? EntryPoint
        return router
    }
    
}
