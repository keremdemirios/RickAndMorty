//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Kerem Demır on 1.04.2023.
//

import UIKit

final class CharacterListView: UIView {
    
    private let viewModel = CharacterListViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.isHidden = true
        collectionView.alpha = 0
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported.")
    }
    
    private func configure(){
        addSubviews(collectionView, spinner)
        configureUI()
        spinner.startAnimating()
        viewModel.fetchCharacters()
        setUpCollectionView()
    }
    
    private func configureUI(){
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo:  rightAnchor)
        ])
    }
    
    private func setUpCollectionView(){
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: { [self] in
            spinner.stopAnimating()
            collectionView.isHidden = false
            
            UIView.animate(withDuration: 0.4) { [self] in
                collectionView.alpha = 1
            }
        })
    }
}
