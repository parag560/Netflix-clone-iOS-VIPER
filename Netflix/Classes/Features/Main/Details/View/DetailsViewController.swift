//
//  DetailsViewController.swift
//  Netflix
//
//  Created by MP-44 on 08/06/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var model : TitlePreviewViewModel?
    
    private var DetailsTableView : UITableView = {
        let table = UITableView(frame: .zero,style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .black
        table.register(DetailsTableViewCell.self, forCellReuseIdentifier: DetailsTableViewCell.identifier )
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    
    private func setupTableView() {
        view.addSubview(DetailsTableView)
        DetailsTableView.delegate = self
        DetailsTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DetailsTableView.frame = view.bounds
    }
    
    
}
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = WebViewHeader()
        header.configure(model: self.model)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.identifier, for: indexPath) as? DetailsTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(model: self.model)
        return cell
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    public func configure(with model: TitlePreviewViewModel) {
        self.model = model
    }
}

