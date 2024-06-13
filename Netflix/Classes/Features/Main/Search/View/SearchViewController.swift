//
//  HomeViewController.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import UIKit

protocol SearchView {
    var presenter : SearchPresentable? {get set}
    func update(with titles: [Title])
    func updateSearchResult(with titles: [Title],searchViewController : UISearchController)
}

class SearchViewController: BaseViewController,SearchView {
    
    func updateSearchResult(with titles: [Title], searchViewController: UISearchController) {
        let resultController = searchViewController.searchResultsController as? SearchResultViewController
        resultController?.titles = titles
        resultController?.searchCollectionViewCell.reloadData()
    }
    
    var presenter: SearchPresentable?
    
    private let searchViewController: UISearchController = {
        let searchViewController = UISearchController( searchResultsController: SearchResultViewController())
        searchViewController.searchBar.placeholder = "Search Movies"
        searchViewController.searchBar.searchBarStyle = .minimal
        return searchViewController
    }()
    
    private let discoverTable : UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()
    
    var titles : [Title] = [Title]()
    
    func update(with titles: [Title]) {
        self.titles = titles
        DispatchQueue.main.async {
            self.discoverTable.reloadData()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Search"
        navigationItem.searchController = searchViewController
        discoverTable.dataSource = self
        discoverTable.delegate = self
        view.addSubview(discoverTable)
        self.presenter?.getData()
        searchViewController.searchResultsUpdater = self
    }

    override func viewDidLayoutSubviews() {
        discoverTable.frame = view.bounds
    }
    
}


extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier,for: indexPath) as? TitleTableViewCell else {return UITableViewCell()}
        
        let title = titles[indexPath.row]
        cell.configure(model: TitleViewModel(titleName: (title.original_title ?? title.original_name) ?? "Unknown", posterURL: title.poster_path ?? ""))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    
}


extension SearchViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchbar = searchController.searchBar
        guard let query = searchbar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
              query.trimmingCharacters(in: .whitespaces).count >= 3
        else {
            return
        }
        self.presenter?.getResultForQuery(query: query, searchViewController: searchController)
    }
}
