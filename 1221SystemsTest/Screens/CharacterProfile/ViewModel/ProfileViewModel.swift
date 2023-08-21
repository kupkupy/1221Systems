//
//  CharacterViewModel.swift
//  1221SystemsTest
//
//  Created by Tanya on 19.08.2023.
//

import UIKit

class ProfileViewModel {
    
    let episodesAPI = EpisodesAPI()
    let locationAPI = LocationAPI()
    
    var infoData: [CharacterData] = []
    var originData: [LocationData] = []
    var episodesData: [EpisodesData] = []
    
    var profileDetails: CharacterData
    
    var originTitle: String
    var characterURL: String
    
    init(profileDetails: CharacterData, originName: String, characterURL: String) {
        self.profileDetails = profileDetails
        self.originTitle = originName
        self.characterURL = characterURL
    }
    
    func fetchCharacterInfo(complition: @escaping () -> ()) {
        infoData.append(profileDetails)
        complition()
    }
    
    func fetchLocationInfo(complition: @escaping () -> ()) {
        locationAPI.getLocation(originName: originTitle) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let locations):
                for location in locations {
                    if location.name == originTitle {
                        self.originData.append(location)
                    }
                }
                complition()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchEpisodeInfo(complition: @escaping () -> ()) {
        episodesAPI.getEpisodeInfo(characterURL: characterURL) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let episodes):
                for episode in episodes {
                    if episode.characters.contains(where: { $0 == self.characterURL }) {
                        self.episodesData.append(episode)
                    }
                }
                complition()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
