//
//  CharacterOriginCell.swift
//  1221SystemsTest
//
//  Created by Tanya on 19.08.2023.
//

import UIKit

class ProfileOriginCell: UITableViewCell {
    
    private lazy var imageBackView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(red: 0.098, green: 0.11, blue: 0.165, alpha: 1)
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var originImageView: UIImageView = {
        let image = UIImage(named: "PlanetImage")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var verticalOriginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var planetNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Unknown"
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var typeOriginLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.278, green: 0.775, blue: 0.045, alpha: 1)
        label.text = "Unknown"
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func activateConstraints() {
        contentView.addSubview(verticalOriginStackView)
        contentView.addSubview(imageBackView)
        contentView.layer.cornerRadius = 16
        contentView.backgroundColor = UIColor.deepDarkGray
        contentView.clipsToBounds = true
        
        imageBackView.addSubview(originImageView)
        
        verticalOriginStackView.addArrangedSubview(planetNameLabel)
        verticalOriginStackView.addArrangedSubview(typeOriginLabel)
        
        NSLayoutConstraint.activate([
            imageBackView.heightAnchor.constraint(equalToConstant: 64),
            imageBackView.widthAnchor.constraint(equalToConstant: 64),
            imageBackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageBackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            imageBackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            originImageView.centerYAnchor.constraint(equalTo: imageBackView.centerYAnchor),
            originImageView.centerXAnchor.constraint(equalTo: imageBackView.centerXAnchor),
            originImageView.widthAnchor.constraint(equalToConstant: 24),
            originImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            verticalOriginStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            verticalOriginStackView.leadingAnchor.constraint(equalTo: imageBackView.trailingAnchor, constant: 16),
            verticalOriginStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            verticalOriginStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    func configureCell(planetName: String, typeOrigin: String) {
        if planetName.isEmpty {
            self.planetNameLabel.text = "Unknown"
        } else {
            self.planetNameLabel.text = planetName
        }
        
        if typeOrigin.isEmpty {
            self.typeOriginLabel.text = "Unknown"
        } else {
            self.typeOriginLabel.text = typeOrigin
        }
    }

}
