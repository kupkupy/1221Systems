//
//  CharactersAPI.swift
//  1221SystemsTest
//
//  Created by Tanya on 18.08.2023.
//

import Foundation

final class CharactersAPI {
    func getCharactersData(complition: @escaping(Result<[CharacterData], Error>) -> ()) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "rickandmortyapi.com"
        urlComponents.path = "/api/character"
        
        let session = URLSession(configuration: .default)
        
        guard let url = urlComponents.url else { return }
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200...300:
                    print("Status: \(response.statusCode)")
                    break
                default:
                    print("Status: \(response.statusCode)")
                }
            }
            
            guard let jsonData = data else { return }
            //print(jsonData.prettyJSON)
            
            do {
                let characterResponse = try JSONDecoder().decode(CharactersResponse.self, from: jsonData)
                let characters = characterResponse.results
                
                DispatchQueue.main.async {
                    complition(.success(characters))
                }
            } catch {
                print(error)
                complition(.failure(error))
            }
        }
        
        task.resume()
    }
}
