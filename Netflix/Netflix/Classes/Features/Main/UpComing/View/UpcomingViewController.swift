//
//  HomeViewController.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import UIKit

protocol UpcomingView {
    
}

class UpcomingViewController: BaseViewController,UpcomingView {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Upcoming"
        
    }


}
