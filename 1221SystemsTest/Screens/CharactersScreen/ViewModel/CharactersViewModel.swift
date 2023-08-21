//
//  CharactersViewModel.swift
//  1221SystemsTest
//
//  Created by Tanya on 19.08.2023.
//

import Foundation

final class CharactersViewModel {
    let chractersAPI = CharactersAPI()
    
    var characters: [CharacterData] = []
    
    func fetchCharacters(complition: @escaping () -> ()) {
        chractersAPI.getCharactersData { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let characters):
                self.characters = characters
                complition()
                return
            case .failure(let error):
                print(error)
            }
        }
    }
}
