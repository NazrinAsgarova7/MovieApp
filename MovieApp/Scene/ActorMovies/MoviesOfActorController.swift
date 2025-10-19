//
//  MoviesOfActorController.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 09.10.25.
//

import UIKit

class MoviesOfActorController: BaseController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(TopImageBottomLabelCell.self, forCellWithReuseIdentifier: "TopImageBottomLabelCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let vm: MoviesOfActorViewModel
    
    init(vm: MoviesOfActorViewModel) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configConstraint() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    override func configVM() {
        vm.getMoviesOfActor()
        vm.success = {
            self.collectionView.reloadData()
        }
        vm.error = { error in
            print(error)
        }
    }
    
    override func configUI() {
        self.title = vm.actorName
    }
}

extension MoviesOfActorController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as? TopImageBottomLabelCell else { return UICollectionViewCell() }
        cell.configure(item: vm.items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 168, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let coordinator = MovieDetailCoordinator(navigationController: self.navigationController ?? UINavigationController(), id: vm.items[indexPath.row].id ?? 0)
        coordinator.start()
    }
}
