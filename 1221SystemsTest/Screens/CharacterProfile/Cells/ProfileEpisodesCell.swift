//
//  CharacterEpisodesCell.swift
//  1221SystemsTest
//
//  Created by Tanya on 19.08.2023.
//

import UIKit

class ProfileEpisodesCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = .systemFont(ofSize: 17)
        label.text = "Title"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var episodeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.278, green: 0.775, blue: 0.045, alpha: 1)
        label.font = .systemFont(ofSize: 13)
        label.text = "Episode: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var seasonLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.278, green: 0.775, blue: 0.045, alpha: 1)
        label.font = .systemFont(ofSize: 13)
        label.text = "Season: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.577, green: 0.595, blue: 0.613, alpha: 1)
        label.font = .systemFont(ofSize: 12)
        label.text = "Release date"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var episodeSeasonStackView: UIStackView = {
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(episodeSeasonStackView)
        contentView.addSubview(releaseDateLabel)
        contentView.layer.cornerRadius = 16
        contentView.backgroundColor = UIColor.deepDarkGray
        contentView.clipsToBounds = true
        
        episodeSeasonStackView.addArrangedSubview(episodeLabel)
        episodeSeasonStackView.addArrangedSubview(seasonLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            episodeSeasonStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            episodeSeasonStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            episodeSeasonStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            releaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            releaseDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            releaseDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
    
    func configureCell(title: String, episode: String, season: String, releaseDate: String) {
        self.titleLabel.text = title
        self.episodeLabel.text = episode
        self.seasonLabel.text = season
        self.releaseDateLabel.text = releaseDate
    }
}
