//
//  HomeRouter.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import UIKit
typealias UpcomingentryPoint = UpcomingView & UIViewController

protocol UpcomingConnectable {
    var UpcomingentryPoint: UpcomingentryPoint? {get}
    static func start()-> UpcomingConnectable
}

class UpcomingRouter : UpcomingConnectable {
    var UpcomingentryPoint: UpcomingentryPoint?
    

    static func start() -> UpcomingConnectable {
        let router = UpcomingRouter()
        
        var view : UpcomingView = UpcomingViewController()
        var presenter : UpcomingPresenter = UpcomingPresenter()
        var interacter : UpComingInteractable = UpcomingInteracter()
        
        view.presenter = presenter
        interacter.upcomingPresenter = presenter
        
        presenter.view = view
        presenter.interacter = interacter
        
        router.UpcomingentryPoint = view as? UpcomingentryPoint
         return router
     }
    
}



