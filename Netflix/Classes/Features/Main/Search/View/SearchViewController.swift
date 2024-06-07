//
//  HomeViewController.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import UIKit

protocol SearchView {
    
}

class SearchViewController: BaseViewController,SearchView {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Search"
        
    }


}
