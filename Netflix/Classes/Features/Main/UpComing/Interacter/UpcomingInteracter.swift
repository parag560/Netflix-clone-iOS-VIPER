//
//  HomeInterarcter.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import Foundation

protocol UpComingInteractable {
    var upcomingPresenter : UpcomingPresentable? {get set}
    func fetchUpcomingFeed()
    var titles : [Title] {get set}
}

class UpcomingInteracter : UpComingInteractable {
    func fetchUpcomingFeed() {
        getUpcoming()
    }
     var titles : [Title] = [Title]()
    var upcomingPresenter: UpcomingPresentable?
    private  func getUpcoming() {
        ApiCaller.shared.getUpcomingMovies { result in
            switch result {
            case .success(let titles):
                self.titles = titles
                self.upcomingPresenter?.feedDataUpdated()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
