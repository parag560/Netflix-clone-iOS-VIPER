//
//  WebViewHeader.swift
//  Netflix
//
//  Created by MP-44 on 08/06/24.
//

import UIKit
import WebKit

class WebViewHeader: UIView {

    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.contentMode = .scaleAspectFit
        return webView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(webView)
        configureWebViewCNS()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func configureWebViewCNS() {
        webView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        webView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
        webView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        webView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
       webView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3.5).isActive = true
    }
    
    func configure(model: TitlePreviewViewModel?) {
        guard let model = model else {
            return
        }
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView?.id.videoId ?? "")") else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
    
    
}
