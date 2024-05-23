//
//  BaseViewController.swift
//  Netflix
//
//  Created by MP-44 on 17/05/24.
//

import UIKit

class BaseViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textChangeColor = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = textChangeColor
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
}
