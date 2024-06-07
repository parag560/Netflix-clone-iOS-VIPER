//
//  HomePresenter.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import Foundation

protocol SearchPresentable {
    var view : SearchView? {get set}
    var interacter : SearchInteractable? {get set}
}

class SearchPresenter : SearchPresentable {
    var view: SearchView?
    
    var interacter: SearchInteractable?
    
  
    
    
    
}
