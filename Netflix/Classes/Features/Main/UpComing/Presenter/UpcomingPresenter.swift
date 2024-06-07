//
//  HomePresenter.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import Foundation

protocol UpcomingPresentable {
    var view : UpcomingView? {get set}
    var interacter : UpComingInteractable? {get set}
    func feedDataUpdated()
    func getData()
    
}

class UpcomingPresenter : UpcomingPresentable {
    func feedDataUpdated() {
        view?.update(with: self.interacter?.titles ?? [])
    }
    
    func getData() {
        self.interacter?.fetchUpcomingFeed()
    }
    
    var view: UpcomingView?
    
    var interacter: UpComingInteractable?
    
  
    
    
    
}
