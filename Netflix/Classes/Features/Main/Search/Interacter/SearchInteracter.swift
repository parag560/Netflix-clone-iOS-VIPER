//
//  HomeInterarcter.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import UIKit

protocol SearchInteractable {
    var searchPresenter : SearchPresentable? {get set}
    func fetchUpcomingFeed()
    var titles : [Title] {get set}
    func fetchResultsForSearchQuery(query : String,searchViewController : UISearchController)
}

class SearchInteracter : SearchInteractable {
    var titles: [Title] = []
    var searchPresenter: SearchPresentable?
    
    private  func getUpcoming() {
        ApiCaller.shared.getUpcomingMovies { result in
            switch result {
            case .success(let titles):
                self.titles = titles
                self.searchPresenter?.feedDataUpdated()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchUpcomingFeed() {
        getUpcoming()
    }
    
    func fetchResultsForSearchQuery(query : String,searchViewController : UISearchController) {
        ApiCaller.shared.search(with: query) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movies) :
                    self.searchPresenter?.searchResultUpdated(titles: movies,searchViewController : searchViewController)
                case .failure(let error) :
                    print(error)
                }
            }
        }
    }
  
    
}
