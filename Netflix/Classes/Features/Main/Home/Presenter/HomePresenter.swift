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
    func fetcheYoutubeData(query: String)
    func youtubeDataFetched(data: VideoElement)
    var videoElement: VideoElement? {get set}
    func didTapCollectionViewCell(at collectionViewIndexPath: IndexPath, in tableViewIndexPath: IndexPath,query: String,viewModel: TitlePreviewViewModel)
    var viewModel: TitlePreviewViewModel? {get set}
}

class HomePresenter : HomePresentable {
    var viewModel: TitlePreviewViewModel?
    
    func didTapCollectionViewCell(at collectionViewIndexPath: IndexPath, in tableViewIndexPath: IndexPath,query: String,viewModel: TitlePreviewViewModel) {
        self.viewModel = viewModel
        fetcheYoutubeData(query: query)
    }
    
    var videoElement: VideoElement?
    var interacter: HomeInteractable?
    var view: HomeView?
    
    func youtubeDataFetched(data: VideoElement) {
        self.videoElement = data
        self.viewModel = TitlePreviewViewModel(title: self.viewModel?.title ?? "", youtubeView: self.videoElement, titleOverview: self.viewModel?.titleOverview ?? "")
        self.view?.updateVideoElement()
    }
    
    func getData() {
        interacter?.fetchHomeFeed()
    }
    
    func fetcheYoutubeData(query: String) {
        interacter?.getMovie(query: query)
    }
    
    func feedDataUpdated() {
        view?.update(with: interacter?.feedDictionary ?? [:])
    }
    
}
