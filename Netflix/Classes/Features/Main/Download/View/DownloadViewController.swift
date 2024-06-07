//
//  HomeViewController.swift
//  Netflix
//
//  Created by MP-44 on 16/05/24.
//

import UIKit

protocol DownloadView {
    
}

class DownloadViewController: BaseViewController,DownloadView {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Downloads"
        
    }


}
