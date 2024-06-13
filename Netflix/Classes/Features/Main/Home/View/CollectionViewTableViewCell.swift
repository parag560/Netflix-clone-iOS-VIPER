//
//  CollectionViewTableViewCell.swift
//  Netflix
//
//  Created by MP-44 on 04/06/23.
//

import UIKit

protocol CollectionViewTableViewCellDelegate: AnyObject {
//    func collectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, viewModel: TitlePreviewViewModel)
    func collectionViewCellTapped(at collectionViewIndexPath: IndexPath, in tableViewCell: UITableViewCell,query: String,viewModel: TitlePreviewViewModel)
}

class CollectionViewTableViewCell: UITableViewCell {
    
    var homePresenter: HomePresentable?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }
    
    private var titles : [Title] = [Title]()
    weak var delegate: CollectionViewTableViewCellDelegate?
    
    private let collecionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    } ()

    static let identifier = "collectionViewTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collecionView)
        collecionView.delegate = self
        collecionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collecionView.frame = contentView.bounds
    }
    
    public func configure(with titles: [Title],presenter: HomePresentable?) {
        self.titles = titles
        self.homePresenter = presenter
        DispatchQueue.main.async { [weak self] in
            self?.collecionView.reloadData()
            
        }
    }
    
}

extension CollectionViewTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {return UICollectionViewCell()}
        guard let model = titles[indexPath.row].poster_path else {return UICollectionViewCell()}
        cell.configure(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let title = titles[indexPath.row]
        guard let titleName = title.original_title ?? title.original_name else {
            return
        }
        
        guard let titleOverview = title.overview else {
            return
        }
        let viewModel = TitlePreviewViewModel(title: titleName, youtubeView: nil, titleOverview: titleOverview)
        delegate?.collectionViewCellTapped(at: indexPath, in: self,query: titleName + " trailer", viewModel: viewModel)
//        self.homePresenter?.fetcheYoutubeData(query: titleName + " trailer")
       
      //  self.delegate?.collectionViewTableViewCellDidTapCell(self, viewModel: viewModel)
    }
    
    
}

