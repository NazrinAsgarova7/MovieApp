//
//  HomeController.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 02.10.25.
//

import UIKit

class HomeController: BaseController {

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 24
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.register(HomeCell.self, forCellWithReuseIdentifier: "HomeCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let viewmodel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configVM() {
        viewmodel.getMovies()
        viewmodel.success = {
            self.collectionView.reloadData()
        }
        viewmodel.error = { error in
            print(error)
        }
    }
    
    override func configConstraint() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    override func configUI() {
        self.title = "Home"
    }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewmodel.mainCellItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell else { return UICollectionViewCell() }
        cell.config(homeModel: viewmodel.mainCellItems[indexPath.row])
        cell.callbackSeeAllButton = {
            let controller = CategoryMoviesController(vm: CategoryMoviesViewModel(categoryTitle:             self.viewmodel.mainCellItems[indexPath.row].title))
            self.navigationController?.config()
            self.show(controller, sender: nil)
        }
        cell.calldidSelectButton = { id in
<<<<<<< Updated upstream
<<<<<<< Updated upstream
            let controller = MovieDetailController(vm: MovieDetailViewModel(id: self.viewmodel.mainCellItems[indexPath.row].movies[id].id ?? 0))
            self.navigationController?.config()
            self.show(controller, sender: nil)
=======
            let coordinator = MovieDetailCoordinator(navigationController: self.navigationController ?? UINavigationController(), id: self.viewmodel.mainCellItems[indexPath.row].movies[id].id ?? 0)
            coordinator.start()
>>>>>>> Stashed changes
=======
            let coordinator = MovieDetailCoordinator(navigationController: self.navigationController ?? UINavigationController(), id: self.viewmodel.mainCellItems[indexPath.row].movies[id].id ?? 0)
            coordinator.start()
>>>>>>> Stashed changes
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 312)
    }
}
