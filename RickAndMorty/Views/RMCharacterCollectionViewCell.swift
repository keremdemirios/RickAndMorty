//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Kerem Demır on 2.04.2023.
//

import UIKit

final class RMCharacterCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "RMCharacterCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel:UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 18, weight: .medium)
        nameLabel.textColor = .label
        nameLabel.textAlignment = .center
        return nameLabel
    }()
    
    private let statusLabel:UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = .systemFont(ofSize: 16, weight: .regular)
        statusLabel.textColor = .secondaryLabel
        statusLabel.textAlignment = .center
        return statusLabel
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported.")
    }
    
    private func configure(){
        contentView.addSubviews(imageView,nameLabel,statusLabel)
        configureUI()
    }
    
    private func configureUI(){
        NSLayoutConstraint.activate([
            statusLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -3),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel){
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatusText
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
}
