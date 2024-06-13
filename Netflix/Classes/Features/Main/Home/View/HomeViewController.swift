//
//  HomeViewController.swift
//  Netflix
//
//  Created by Parag Gajbhiye on 16/05/24.
//

import UIKit

protocol HomeView {
    func update(with dictionary: [String: [Title]])
    var presenter : HomePresentable? {get set}
    func updateVideoElement()
}

class HomeViewController: BaseViewController,HomeView {
    func updateVideoElement() {
        DispatchQueue.main.async { [weak self] in
            let vc = DetailsViewController()
            vc.configure(with: (self?.presenter?.viewModel)!)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    var presenter: HomePresentable?
    var homeFeedDictionary : [String: [Title]] = [:]
    var homeFeedOrder = ["Trending Movies", "Popular", "Trending TV", "Upcoming Movies", "Top Rated"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        setupTableView()
        configureNavbar()
        presenter?.getData()
    }
    
    private var homeTableView : UITableView = {
        let table = UITableView(frame: .zero,style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .black
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier )
        return table
    }()
    
    private var activityIndicator : UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        
        return indicator
    }()
    
    private func setupTableView() {
        view.addSubview(homeTableView)
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeTableView.frame = view.bounds
    }
    
    func update(with dictionary: [String : [Title]]) {
        DispatchQueue.main.async {
            self.homeFeedDictionary[dictionary.keys.first!] =  dictionary[dictionary.keys.first!]
            self.homeTableView.reloadData()
        }
    }
    
    private func configureNavbar() {
        var logo = UIImage(named: "logo")
        logo = logo?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: logo, style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)]
        navigationController?.navigationBar.tintColor = .label
    }
    
}

extension HomeViewController : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return homeFeedOrder.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _ = homeFeedDictionary[homeFeedOrder[section]] else {
            return 0
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let _ = homeFeedDictionary[homeFeedOrder[section]] {
            return homeFeedOrder[section]
        } else {
            return  ""
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {
            return
        }
        header.textLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        header.textLabel?.textColor = .white
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        if let data = self.homeFeedDictionary[homeFeedOrder[indexPath.section]] {
            cell.configure(with: data, presenter: self.presenter)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension HomeViewController: CollectionViewTableViewCellDelegate {
    func collectionViewCellTapped(at collectionViewIndexPath: IndexPath, in tableViewCell: UITableViewCell, query: String, viewModel: TitlePreviewViewModel) {
        guard let tableViewIndexPath = self.homeTableView.indexPath(for: tableViewCell) else { return }
        self.presenter?.didTapCollectionViewCell(at: collectionViewIndexPath, in: tableViewIndexPath,query: query,viewModel: viewModel)
    }
}
