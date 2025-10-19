//
//  MovieDetailCell.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 13.10.25.
//

import UIKit

class MovieDetailCell: UITableViewCell {
    private lazy var backgroundMovieImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.opacity = 0.80
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var movieImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var earthImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "globe")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var watchImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "clock")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var starImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "star.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.textAlignment = .center
        l.font = .systemFont(ofSize: 20, weight: .medium)
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var languageLabel: UILabel = {
        let l = UILabel()
        l.textColor = .lightGray
        l.font = .systemFont(ofSize: 16)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var runtimeLabel: UILabel = {
        let l = UILabel()
        l.textColor = .lightGray
        l.font = .systemFont(ofSize: 16)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var ratingLabel: UILabel = {
        let l = UILabel()
        l.textColor = .lightGray
        l.font = .systemFont(ofSize: 16)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var overviewLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 16)
        l.numberOfLines = 0
        l.textAlignment = .justified
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var title: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 20, weight: .semibold)
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
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
    
    private var similarMovies: [SimilarMovieResult]?
    
    var didSelectCallback: ((Int) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraint() {
        [backgroundMovieImageView, movieImageView, earthImageView, watchImageView, starImageView, titleLabel, languageLabel, runtimeLabel, ratingLabel, overviewLabel, title, collectionView].forEach { item in
            contentView.addSubview(item)
        }
        
        NSLayoutConstraint.activate([
            backgroundMovieImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            backgroundMovieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundMovieImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundMovieImageView.widthAnchor.constraint(equalToConstant: 350),
            backgroundMovieImageView.heightAnchor.constraint(equalToConstant: 250),
            
            movieImageView.topAnchor.constraint(equalTo: backgroundMovieImageView.topAnchor, constant: 100),
            movieImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            movieImageView.widthAnchor.constraint(equalToConstant: 167),
            movieImageView.heightAnchor.constraint(equalToConstant: 240),
            
            titleLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            languageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            languageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            
            earthImageView.leadingAnchor.constraint(equalTo: languageLabel.trailingAnchor, constant: 8),
            earthImageView.centerYAnchor.constraint(equalTo: languageLabel.centerYAnchor),
            earthImageView.widthAnchor.constraint(equalToConstant: 24),
            earthImageView.heightAnchor.constraint(equalToConstant: 24),
            
            runtimeLabel.centerYAnchor.constraint(equalTo: earthImageView.centerYAnchor),
            runtimeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            watchImageView.leadingAnchor.constraint(equalTo: runtimeLabel.trailingAnchor, constant: 8),
            watchImageView.centerYAnchor.constraint(equalTo: earthImageView.centerYAnchor),
            watchImageView.widthAnchor.constraint(equalToConstant: 24),
            watchImageView.heightAnchor.constraint(equalToConstant: 24),
            
            ratingLabel.centerYAnchor.constraint(equalTo: watchImageView.centerYAnchor),
            
            starImageView.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 8),
            starImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            starImageView.centerYAnchor.constraint(equalTo: earthImageView.centerYAnchor),
            starImageView.widthAnchor.constraint(equalToConstant: 24),
            starImageView.heightAnchor.constraint(equalToConstant: 24),
            
            overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            overviewLabel.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 24),
            
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 24),
            title.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 24),
            
            collectionView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func configUI(movieDetail: MovieDetail, similarMovies: [SimilarMovieResult]) {
        let imageUrl = NetworkingHelper.shared.configImgURL(endpoint: movieDetail.backdropPath ?? "")
        let image = NetworkingHelper.shared.configImgURL(endpoint: movieDetail.posterPath ?? "")
        backgroundMovieImageView.loadImage(image: imageUrl)
        movieImageView.loadImage(image: image)
        titleLabel.text = movieDetail.originalTitle
        languageLabel.text = movieDetail.spokenLanguages?[0].name
        runtimeLabel.text = String(movieDetail.runtime ?? 0) + "min"
        ratingLabel.text = String(format: "%.1f", movieDetail.voteAverage ?? 0.0) + "/10"
        overviewLabel.text = movieDetail.overview
        self.similarMovies = similarMovies
        title.text = "Similar Movies"
        collectionView.reloadData()
    }
}

extension MovieDetailCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        similarMovies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as? TopImageBottomLabelCell else { return UICollectionViewCell() }
        if let sm = similarMovies?[indexPath.row] {
            cell.configure(item: sm)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 168, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        didSelectCallback?(similarMovies?[indexPath.row].id ?? 0)
    }
}
