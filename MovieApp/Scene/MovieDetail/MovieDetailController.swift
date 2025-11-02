//
//  MovieDetailController.swift
//  MovieApp
//
//  Created by Nazrin Asgarova on 11.10.25.
//

import UIKit

class MovieDetailController: BaseController {
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.rowHeight = UITableView.automaticDimension
        tv.allowsSelection = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let vm: MovieDetailViewModel
    
    init(vm: MovieDetailViewModel) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MovieDetailCell.self, forCellReuseIdentifier: "MovieDetailCell")
    }
    
    override func configConstraint() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    override func configVM() {
        vm.getMovieDetail()
        vm.getSimilarMovie()
        vm.success = {
            self.tableView.reloadData()
            self.configUI()
        }
        vm.error = { error in
            print(error)
        }
    }
    
    override func configUI() {
        vm.isFavorite { [weak self] isFav in
            if isFav {
                self?.configRightBarButton(image: "heart.fill")
            } else {
                self?.configRightBarButton(image: "heart")
            }
        }
        self.title = vm.movieDetail.originalTitle
    }
    
    @objc func addFavorite() {
        vm.isFavorite { [weak self] isFavorite in
            if !isFavorite {
                self?.vm.addFavorite()
                self?.tableView.reloadData()
                self?.configRightBarButton(image: "heart.fill")
            } else {
                self?.vm.deleteFavorite()
                self?.configRightBarButton(image: "heart")
            }
        }
    }
    
    private func configRightBarButton(image: String) {
        let rightButton = UIBarButtonItem(image: UIImage(systemName: image), style: .plain, target: self, action: #selector(self.addFavorite))
        rightButton.tintColor = .red
        self.navigationItem.rightBarButtonItem = rightButton
    }
}

extension MovieDetailController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailCell") as! MovieDetailCell
        cell.didSelectCallback = { id, movie in
            let coordinator = MovieDetailCoordinator(navigationController: self.navigationController ?? UINavigationController(),
                                                  //   id: id,
                                                     movie: movie)
            coordinator.start()
        }
        cell.configUI(movieDetail: vm.movieDetail, similarMovies: vm.similarMovies)
        return cell
    }
}
