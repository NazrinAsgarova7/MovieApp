//
//  CategoryMoviesController.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 11.10.25.
//

import UIKit


class CategoryMoviesController: BaseController {
    
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
    
    private var refreshController = UIRefreshControl()
    
    let vm: CategoryMoviesViewModel
    
    init(vm: CategoryMoviesViewModel) {
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
        vm.getMovies()
        vm.success = {
            self.refreshController.endRefreshing()
            self.collectionView.reloadData()
        }
        vm.error = { error in
            print(error)
        }
    }
    
    override func configUI() {
        collectionView.refreshControl = self.refreshController
        refreshController.addTarget(self, action: #selector(refreshScreen), for: .valueChanged)
    }
    
    @objc func  refreshScreen() {
        vm.removeItems()
        collectionView.reloadData()
        vm.getMovies()
    }
}

extension CategoryMoviesController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as? TopImageBottomLabelCell else { return UICollectionViewCell() }
        cell.configure(item: vm.movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 168, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
<<<<<<< Updated upstream
        let controller = MovieDetailController(vm: MovieDetailViewModel(id: vm.movies[indexPath.row].id ?? 0))
        show(controller, sender: nil)
=======
        let coordinator = MovieDetailCoordinator(navigationController: self.navigationController ?? UINavigationController(), id: vm.movies[indexPath.row].id ?? 0)
        coordinator.start()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        vm.pagination(index: indexPath.row)
>>>>>>> Stashed changes
    }
}
