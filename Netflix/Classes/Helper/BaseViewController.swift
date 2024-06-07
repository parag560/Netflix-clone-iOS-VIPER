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
        navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white, // Set your preferred large title color
            .font: UIFont.systemFont(ofSize: 34, weight: .bold) // Optional: Set your preferred font
        ]
    }
}
