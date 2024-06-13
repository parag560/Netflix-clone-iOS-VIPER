//
//  HomeRouter.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import UIKit
typealias SearchentryPoint = SearchView & UIViewController

protocol SearchConnectable {
    var SearchentryPoint: SearchentryPoint? {get}
    static func start()-> SearchConnectable
}

class SearchRouter : SearchConnectable {
    var SearchentryPoint: SearchentryPoint?
    
    static func start() -> SearchConnectable {
        let router = SearchRouter()
        
        var view : SearchView = SearchViewController()
        var presenter : SearchPresentable = SearchPresenter()
        var interacter : SearchInteractable = SearchInteracter()
        
        view.presenter = presenter
        interacter.searchPresenter = presenter
        
        presenter.view = view
        presenter.interacter = interacter
        
        router.SearchentryPoint = view as? SearchentryPoint
        return router
    }
}
