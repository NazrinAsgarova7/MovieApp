//
//  HomeCell.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 02.10.25.
//

import UIKit

class HomeCell: UICollectionViewCell {
    private lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = .systemFont(ofSize: 20)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var button: UIButton = {
        let b = UIButton()
        b.setTitle("See all", for: .normal)
        b.setTitleColor(.systemBlue, for: .normal)
        b.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        b.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(TopImageBottomLabelCell.self, forCellWithReuseIdentifier: "TopImageBottomLabelCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var movies = [MovieResult]()
    var callbackSeeAllButton: (() -> Void)?
    var calldidSelectButton: ((Int) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraint() {
        [titleLabel, button, collectionView].forEach { view in
            contentView.addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            button.topAnchor.constraint(equalTo: topAnchor),

            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    @objc func buttonAction() {
        callbackSeeAllButton?()
    }
    
    func config(homeModel: HomeModel) {
        titleLabel.text = homeModel.title
        movies = homeModel.movies
        collectionView.reloadData()
    }
}

extension HomeCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as? TopImageBottomLabelCell else { return UICollectionViewCell() }
        cell.configure(item: movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 168, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        calldidSelectButton?(indexPath.row)
    }
}
