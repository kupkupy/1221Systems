//
//  ViewController.swift
//  1221SystemsTest
//
//  Created by Tanya on 17.08.2023.
//

import UIKit

class LaunchScreenVC: UIViewController {
    
    private lazy var backgroundImageView: UIImageView = {
        let image = UIImage(named: "BackgroundLaunchScreen")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var portalImageView: UIImageView = {
        let image = UIImage(named: "PortalImage")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var labelImageView: UIImageView = {
        let image = UIImage(named: "LabelImage")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        activateConstraints()
        
        showCharactersVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Views hierarchy
    private func setupViews() {
        self.view.backgroundColor = UIColor.deepDarkBlue
        
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(labelImageView)
        backgroundImageView.addSubview(portalImageView)
    }
    
    //MARK: - Private methods
    private func showCharactersVC() {
        Task {
            do {
                let charactersVC = CharactersVC()
                try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
                navigationController?.pushViewController(charactersVC, animated: true)
                charactersVC.navigationController?.navigationBar.isHidden = true
            } catch {
                print(error)
            }
        }
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelImageView.widthAnchor.constraint(equalToConstant: 140),
            labelImageView.heightAnchor.constraint(equalToConstant: 40),
            labelImageView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 164),
            labelImageView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 118)
        ])
        
        NSLayoutConstraint.activate([
            portalImageView.widthAnchor.constraint(equalToConstant: 140),
            portalImageView.heightAnchor.constraint(equalToConstant: 228),
            portalImageView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 240),
            portalImageView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 118)
        ])
    }
}




