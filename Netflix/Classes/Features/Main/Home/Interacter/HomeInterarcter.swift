//
//  HomeInterarcter.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import Foundation



protocol HomeInteractable {
    var homePresenter : HomePresentable? {get set}
    func fetchHomeFeed()
    var feedDictionary : [String: [Title]] {get set}
}

enum Sections : String, CaseIterable {
    case TrendingMovies = "Trending Movies"
    case Popular = "Popular"
    case TrendingTv = "Trending TV"
    case Upcoming = "Upcoming Movies"
    case TopRated = "Top Rated"
}




class HomeInterarcter : HomeInteractable {
    var homePresenter: HomePresentable?
    
    
    var feedDictionary : [String: [Title]] = [:]
    
    func fetchHomeFeed() {
        getTrendingMovies()
        getPopular()
        getTrendingTV()
        getUpcomingMovies()
        getTopRated()
    }
    
    func fetchData() {
        fetchHomeFeed()
    }
    
    func getTrendingMovies() {
        ApiCaller.shared.getTrendingMovies { [weak self] result in
            
            switch result {
            case .success(let titles):
                self?.feedDictionary = [Sections.TrendingMovies.rawValue : titles]
                self?.homePresenter?.feedDataUpdated()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getPopular() {
        ApiCaller.shared.getPopular {[weak self] result in
           
            switch result {
            case .success(let titles):
                self?.feedDictionary = [Sections.Popular.rawValue : titles]
                self?.homePresenter?.feedDataUpdated()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getTrendingTV() {
        ApiCaller.shared.getTrendingTV {[weak self] result in
           
            switch result {
            case .success(let titles):
                self?.feedDictionary = [Sections.TrendingTv.rawValue : titles]
                self?.homePresenter?.feedDataUpdated()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getUpcomingMovies() {
        ApiCaller.shared.getUpcomingMovies {[weak self] result in
            
            switch result {
            case .success(let titles):
                self?.feedDictionary = [Sections.Upcoming.rawValue : titles]
                self?.homePresenter?.feedDataUpdated()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getTopRated() {
        ApiCaller.shared.getTopRated { [weak self] result in
            
            switch result {
            case .success(let titles):
                self?.feedDictionary = [Sections.TopRated.rawValue : titles]
                self?.homePresenter?.feedDataUpdated()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
