//
//  SearchResultsViewController.swift
//  MovieHunt
//
//  Created by Matias Martinelli on 12/11/2023.
//

import UIKit

protocol SearchResultsViewControllerDelegate: AnyObject {
    func searchResultsViewController(_ viewModel: TitlePreviewViewModel)
}

//This is the controller responsible for viewing the data that we are going to retrive from de DB 

class SearchResultsViewController: UIViewController {
    
    public var titles: [Title] = [Title]()
    
    public weak var delegate: SearchResultsViewControllerDelegate?
    
    public let searchResultCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(searchResultCollectionView)
        
        searchResultCollectionView.delegate = self
        searchResultCollectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultCollectionView.frame = view.bounds
    }

}

extension SearchResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let titles = titles[indexPath.row]
        cell.configure(with: titles.poster_path ?? "")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let titles = titles[indexPath.row]
        
        let titleName = titles.original_title ?? ""

        APICaller.shared.getMovie(with: titleName) { [weak self] result in
            switch result {
            case .success(let videoElement):
                self?.delegate?.searchResultsViewController(TitlePreviewViewModel(title: titleName, youtubeView: videoElement, titleOverView: titles.overview ?? ""))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
    
    
}
