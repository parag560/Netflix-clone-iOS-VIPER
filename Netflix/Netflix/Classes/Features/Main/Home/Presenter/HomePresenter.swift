//
//  HomePresenter.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import Foundation

protocol HomePresentable {
    var view : HomeView? {get set}
    var interacter : HomeInteractable? {get set}
    func feedDataUpdated()
    func getData()
}

class HomePresenter : HomePresentable {
    func getData() {
        interacter?.fetchHomeFeed()
    }
    
   
    
    var interacter: HomeInteractable?
    var view: HomeView?
    
    func feedDataUpdated() {
        view?.update(with: interacter?.feedDictionary ?? [:])
    }
    
    
}
