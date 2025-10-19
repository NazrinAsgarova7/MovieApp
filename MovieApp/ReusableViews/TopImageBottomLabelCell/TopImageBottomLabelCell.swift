//
//  MovieCell.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 05.10.25.
//

import Foundation
import UIKit

protocol TopImageBottomLabelCellProtocol {
    var titleLabel: String { get }
    var imageUrl: String { get }
}

class TopImageBottomLabelCell: UICollectionViewCell {
    private lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = .systemFont(ofSize: 20)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var imageView: UIImageView = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFill
        i.layer.cornerRadius = 16
        i.layer.masksToBounds = true
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configConstraint() {
        [imageView, titleLabel].forEach { view in
            addSubview(view)
        }
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 167),
            imageView.heightAnchor.constraint(equalToConstant: 240),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8)
        ])
    }
    
    func configure(item: TopImageBottomLabelCellProtocol) {
        titleLabel.text = item.titleLabel
        let imageUrl = NetworkingHelper.shared.configImgURL(endpoint: item.imageUrl)
        imageView.loadImage(image: imageUrl)
    }
}
