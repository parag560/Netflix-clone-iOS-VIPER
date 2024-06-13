//
//  HomeViewController.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import UIKit

protocol UpcomingView {
    var presenter : UpcomingPresentable? {get set}
    func update(with titles: [Title])
}

class UpcomingViewController: BaseViewController,UpcomingView {
    
    func update(with titles: [Title]) {
        self.titles = titles
        DispatchQueue.main.async {
            self.upcomingTable.reloadData()
        }
    }
    
    var presenter: UpcomingPresentable?
    
    private let upcomingTable : UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
        
    }()

   
    private var titles : [Title] = [Title]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Upcoming"
        view.addSubview(upcomingTable)
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
        self.presenter?.getData()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }
    
   


}


extension UpcomingViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {return UITableViewCell()}
        let title = titles[indexPath.row]
        cell.configure(model: TitleViewModel(titleName: (title.original_title ?? title.original_name) ?? "Unknown", posterURL: title.poster_path ?? ""))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
 
    
    
    
}
