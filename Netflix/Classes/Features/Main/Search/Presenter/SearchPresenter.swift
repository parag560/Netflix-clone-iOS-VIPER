//
//  HomePresenter.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import UIKit

protocol SearchPresentable {
    var view : SearchView? {get set}
    var interacter : SearchInteractable? {get set}
    func feedDataUpdated()
    func getData()
    func searchResultUpdated(titles: [Title],searchViewController : UISearchController)
    func getResultForQuery(query: String,searchViewController : UISearchController)
}

class SearchPresenter : SearchPresentable {
    func getResultForQuery(query: String, searchViewController: UISearchController) {
        self.interacter?.fetchResultsForSearchQuery(query: query,searchViewController: searchViewController)
    }
    
    func searchResultUpdated(titles: [Title],searchViewController : UISearchController) {
        self.view?.updateSearchResult(with: titles, searchViewController: searchViewController)
    }
    
   
    
 
    var view: SearchView?
    
    var interacter: SearchInteractable?
    
  
    func feedDataUpdated() {
        view?.update(with: self.interacter?.titles ?? [])
    }
    
    func getData() {
        self.interacter?.fetchUpcomingFeed()
    }

}
