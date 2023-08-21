//
//  CharactersCollectionCell.swift
//  1221SystemsTest
//
//  Created by Tanya on 17.08.2023.
//

import UIKit

class CharactersCell: UICollectionViewCell {
    
    private lazy var backView: UIView = {
        let imageView = UIView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.deepDarkGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.deepDarkGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17)
        label.text = "Character name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        addSubview(backView)
        backView.addSubview(imageView)
        backView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            backView.heightAnchor.constraint(equalToConstant: 202),
            backView.widthAnchor.constraint(equalToConstant: 156),
            backView.topAnchor.constraint(equalTo: topAnchor),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -8),
            imageView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -54)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -8),
            nameLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16)
        ])
    }
    
    //MARK: - Public
    func configureCharacterCell(with imageURL: String, _ text: String) {
        guard let url = URL(string: imageURL) else { return }
        imageView.load(url: url)
        nameLabel.text = text
    }
}
