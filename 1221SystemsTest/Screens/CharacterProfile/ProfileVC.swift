//
//  CharacterProfileVC.swift
//  1221SystemsTest
//
//  Created by Tanya on 18.08.2023.
//

import UIKit

class ProfileVC: UIViewController {
    
    var headerView = ProfileHeaderView()
    
    var viewModel: ProfileViewModel?
    
    enum Section {
        case info(items: [CharacterData])
        case origin(items: [LocationData])
        case episodes(items: [EpisodesData])
        
        var title: String {
            switch self {
            case .info: return "Info"
            case .origin: return "Origin"
            case .episodes: return "Episodes"
            }
        }
    }
    
    private var isInfoEnabled = true
    private var isOriginEnabled = true
    private var isEpisodesEnabled = true
    
    var infoDataSource: [CharacterData] = []
    var originDataSource: [LocationData] = []
    var episodesDataSource: [EpisodesData] = []
    
    private var dataSource = [Section]()
    
    var originTitle: String = ""
    var characterURL: String = ""
    
    private lazy var profileTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.deepDarkBlue
        tableView.separatorStyle = .none
        tableView.register(ProfileInfoCell.self, forCellReuseIdentifier: ProfileInfoCell.identifier)
        tableView.register(ProfileOriginCell.self, forCellReuseIdentifier: ProfileOriginCell.identifier)
        tableView.register(ProfileEpisodesCell.self, forCellReuseIdentifier: ProfileEpisodesCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        activateConstraints()
        
        updateDataSources()
        dataSource = createDataSource()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backButtonTitle = ""
    }
        
    //MARK: - Views hierarchy
    private func setupViews() {
        view.backgroundColor = UIColor.deepDarkBlue
        
        view.addSubview(headerView)
        view.addSubview(profileTableView)
    }
        
    //MARK: - Activate constraints
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            profileTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            profileTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            profileTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

private extension ProfileVC {
    
    func updateDataSources() {
        
        if let viewModel = viewModel {
            viewModel.fetchCharacterInfo {
                self.infoDataSource = viewModel.infoData
                self.originTitle = viewModel.originTitle
                DispatchQueue.main.async {
                    self.profileTableView.reloadData()
                }
            }

            viewModel.fetchLocationInfo {
                self.originDataSource = viewModel.originData
                DispatchQueue.main.async {
                    self.profileTableView.reloadData()
                }
            }

            viewModel.fetchEpisodeInfo {
                self.episodesDataSource = viewModel.episodesData
                DispatchQueue.main.async {
                    self.profileTableView.reloadData()
                }
            }
        }
    }
    
    func createDataSource() -> [Section] {
        var sections = [Section]()
        
        if isInfoEnabled {
            sections.append(Section.info(items: infoDataSource))
        }
        
        if isOriginEnabled {
            sections.append(Section.origin(items: originDataSource))
        }
        
        if isEpisodesEnabled {
            sections.append(Section.episodes(items: episodesDataSource))
        }
        
        return sections
    }
}

extension ProfileVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch dataSource[section] {
        case .info(let items): return items.count
        case .origin(let items): return items.count
        case .episodes(let items): return items.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        dataSource[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = dataSource[indexPath.section]
        
        switch section {
        case .info(let items):
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileInfoCell.identifier, for: indexPath) as? ProfileInfoCell
            cell?.backgroundColor = .clear
            
            let item = items[indexPath.row]
            cell?.configureCell(species: item.species.rawValue, type: item.type, gender: item.gender.rawValue)
            
            return cell ?? UITableViewCell()
            
        case .origin(let items):
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileOriginCell.identifier, for: indexPath) as? ProfileOriginCell
            cell?.backgroundColor = .clear
            
            let item = items[indexPath.row]
            cell?.configureCell(planetName: self.originTitle, typeOrigin: item.type)
            
            return cell ?? UITableViewCell()
            
        case .episodes(let items):
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileEpisodesCell.identifier, for: indexPath) as? ProfileEpisodesCell
            cell?.backgroundColor = .clear
            
            let item = items[indexPath.row]
            if let episode = (item.episode.split(separator: "E").first?.split(separator: "S"))?.joined(), let season = item.episode.split(separator: "E").last {
                cell?.configureCell(title: item.name, episode: episode, season: String(season), releaseDate: item.airDate)
            }
            
            return cell ?? UITableViewCell()
        }
    }
}

extension ProfileVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            if let character = viewModel?.profileDetails {
                headerView.configureHeaderView(url: character.image, name: character.name, status: character.status.rawValue)
            }
            return headerView
        } else {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
}
