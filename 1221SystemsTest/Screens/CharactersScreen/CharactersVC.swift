//
//  CharactersVC.swift
//  1221SystemsTest
//
//  Created by Tanya on 17.08.2023.
//

import UIKit

class CharactersVC: UIViewController {
    
    let profiledetailsAPI = LocationAPI()
    
    var viewModel = CharactersViewModel()
    
    private enum Constants {
        static let itemCount: CGFloat = 2
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Characters"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        return layout
    }()
    
    lazy var charactersCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.backgroundColor = UIColor.deepDarkBlue
        collectionView.dataSource = self 
        collectionView.delegate = self
        collectionView.register(CharactersCell.self, forCellWithReuseIdentifier: CharactersCell.identifier)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
   
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupCollectionView()
        
        viewModel.fetchCharacters {
            self.charactersCollectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Views hierarchy
    private func setupViews() {
        view.backgroundColor = UIColor.deepDarkBlue
    }
    
    //MARK: - Setup collectionView
    private func setupCollectionView() {
        view.addSubview(titleLabel)
        view.addSubview(charactersCollectionView)
        
        #warning("На макете отступы: слева 20, справа 27. Поставила пока по 22 с каждой стороны.")
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -22)
        ])
        
        NSLayoutConstraint.activate([
            charactersCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            charactersCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22),
            charactersCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -22),
            charactersCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        return CGSize(width: 156, height: 202)
    }
}

extension CharactersVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.itemSize(for: collectionView.frame.width, with: layout.minimumInteritemSpacing)
    }
}

extension CharactersVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCell.identifier, for: indexPath) as? CharactersCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        let character = viewModel.characters[indexPath.row]
        
        cell.configureCharacterCell(with: character.image, character.name)
        
        return cell
    }
}

extension CharactersVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = viewModel.characters[indexPath.row]
        print(character.episode)
        let profileVC = ProfileVC()
        let profileViewModel = ProfileViewModel(profileDetails: character, originName: character.origin.name, characterURL: character.url)
        profileVC.viewModel = profileViewModel

        navigationController?.pushViewController(profileVC, animated: true)
        profileVC.navigationController?.navigationBar.isHidden = false
    }
}

