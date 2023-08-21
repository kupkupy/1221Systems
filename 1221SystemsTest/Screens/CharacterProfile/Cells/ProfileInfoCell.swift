//
//  CharacterInfoCell.swift
//  1221SystemsTest
//
//  Created by Tanya on 19.08.2023.
//

import UIKit

class ProfileInfoCell: UITableViewCell {
    
    private lazy var verticalInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    //MARK: Species
    private lazy var speciesLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.768, green: 0.789, blue: 0.808, alpha: 1)
        label.text = "Species:"
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var speciesResponseLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "response"
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var horizontalSpeciesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    //MARK: Type
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.768, green: 0.789, blue: 0.808, alpha: 1)
        label.text = "Type:"
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var typeResponseLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "response"
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var horizontalTypeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    //MARK: Gender
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.768, green: 0.789, blue: 0.808, alpha: 1)
        label.text = "Gender:"
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genderResponseLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "response"
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var horizontalGenderStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func activateConstraints() {
        contentView.addSubview(verticalInfoStackView)
        contentView.layer.cornerRadius = 16
        contentView.backgroundColor = UIColor.deepDarkGray
        contentView.clipsToBounds = true
        
        verticalInfoStackView.addArrangedSubview(horizontalSpeciesStackView)
        verticalInfoStackView.addArrangedSubview(horizontalTypeStackView)
        verticalInfoStackView.addArrangedSubview(horizontalGenderStackView)
        
        horizontalSpeciesStackView.addArrangedSubview(speciesLabel)
        horizontalSpeciesStackView.addArrangedSubview(speciesResponseLabel)
        
        horizontalTypeStackView.addArrangedSubview(typeLabel)
        horizontalTypeStackView.addArrangedSubview(typeResponseLabel)
        
        horizontalGenderStackView.addArrangedSubview(genderLabel)
        horizontalGenderStackView.addArrangedSubview(genderResponseLabel)
        
        NSLayoutConstraint.activate([
            verticalInfoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            verticalInfoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            verticalInfoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            verticalInfoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            horizontalSpeciesStackView.leadingAnchor.constraint(equalTo: verticalInfoStackView.leadingAnchor, constant: 16),
            horizontalSpeciesStackView.trailingAnchor.constraint(equalTo: verticalInfoStackView.trailingAnchor, constant: -16)
        ])
    }
    
    func configureCell(species: String, type: String, gender: String) {
        if species.isEmpty {
            self.speciesResponseLabel.text = "None"
        } else {
            self.speciesResponseLabel.text = species
        }
        
        if type.isEmpty {
            self.typeResponseLabel.text = "None"
        } else {
            self.typeResponseLabel.text = type
        }
        
        if gender.isEmpty {
            self.genderResponseLabel.text = "None"
        } else {
            self.genderResponseLabel.text = gender
        }
    }
}
