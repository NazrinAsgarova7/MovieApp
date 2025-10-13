//
//  HeaderView.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 11.10.25.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    lazy var movieImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var earthImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "globe")
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()
    
    lazy var watchImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "clock")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var starImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "star.fill")
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = .systemFont(ofSize: 20, weight: .medium)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraint() {
        [movieImageView, earthImageView, watchImageView, starImageView, titleLabel, languageLabel, runtimeLabel, ratingLabel, overviewLabel].forEach { item in
            self.addSubview(item)
        }
        
        NSLayoutConstraint.activate([
                  movieImageView.topAnchor.constraint(equalTo: self.topAnchor),
                  movieImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                  movieImageView.widthAnchor.constraint(equalToConstant: 350),
                  movieImageView.heightAnchor.constraint(equalToConstant: 400),

                  titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
                  titleLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 24),

                  languageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                  languageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
                  
                  earthImageView.leadingAnchor.constraint(equalTo: languageLabel.trailingAnchor, constant: 8),
                  earthImageView.centerYAnchor.constraint(equalTo: languageLabel.centerYAnchor),
                  earthImageView.widthAnchor.constraint(equalToConstant: 24),
                  earthImageView.heightAnchor.constraint(equalToConstant: 24),

                  runtimeLabel.leadingAnchor.constraint(equalTo: earthImageView.trailingAnchor, constant: 44),
                  runtimeLabel.centerYAnchor.constraint(equalTo: earthImageView.centerYAnchor),

                  watchImageView.leadingAnchor.constraint(equalTo: runtimeLabel.trailingAnchor, constant: 8),
                  watchImageView.centerYAnchor.constraint(equalTo: earthImageView.centerYAnchor),
                  watchImageView.widthAnchor.constraint(equalToConstant: 24),
                  watchImageView.heightAnchor.constraint(equalToConstant: 24),

                 
                  ratingLabel.leadingAnchor.constraint(equalTo: watchImageView.trailingAnchor, constant: 44),
                  ratingLabel.centerYAnchor.constraint(equalTo: watchImageView.centerYAnchor),

                  starImageView.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 8),
                  starImageView.centerYAnchor.constraint(equalTo: earthImageView.centerYAnchor),
                  starImageView.widthAnchor.constraint(equalToConstant: 24),
                  starImageView.heightAnchor.constraint(equalToConstant: 24),
                  
                  overviewLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor),
                  overviewLabel.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor),
                  overviewLabel.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 24),
                  overviewLabel.centerXAnchor.constraint(equalTo: movieImageView.centerXAnchor)
           ])
    }
    
    func config(result: MovieDetail) {
        let imageUrl = NetworkingHelper.shared.configImgURL(endpoint: result.backdropPath ?? "")
        movieImageView.loadImage(image: imageUrl)
        titleLabel.text = result.belongsToCollection?.name
        languageLabel.text = result.spokenLanguages?[0].name
        runtimeLabel.text = String(result.runtime ?? 0) + "min"
        ratingLabel.text = String(result.voteAverage ?? 0.0) + "/10"
        overviewLabel.text = result.overview
    }
}
