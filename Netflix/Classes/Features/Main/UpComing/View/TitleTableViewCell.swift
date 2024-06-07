//
//  TitleTableViewCell.swift
//  Netflix
//
//  Created by MP-44 on 08/06/23.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    static let identifier = "TitleTableViewCell"
    
    private let posterImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    private let title : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playTitleButton : UIButton = {
       let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(posterImage)
        contentView.addSubview(title)
        contentView.addSubview(playTitleButton)
        setConstraints()
    }
    
    
    private func setConstraints() {
        let posterImageConstraint = [
            posterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            posterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            posterImage.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleConstraint = [
            title.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor,constant: 20),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            title.widthAnchor.constraint(equalToConstant: 200)
        ]
        
        let buttonConstraint = [
            playTitleButton.leadingAnchor.constraint(equalTo: title.trailingAnchor),
            playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(posterImageConstraint)
        NSLayoutConstraint.activate(titleConstraint)
        NSLayoutConstraint.activate(buttonConstraint)
    }
    
    
    public func configure(model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        
        posterImage.sd_setImage(with: url)
        title.text = model.titleName
    }


}

