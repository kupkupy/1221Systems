//
//  EpisodesAPI.swift
//  1221SystemsTest
//
//  Created by Tanya on 20.08.2023.
//

import Foundation

final class EpisodesAPI {
    func getEpisodeInfo(characterURL: String, complition: @escaping(Result<[EpisodesData], Error>) -> ()) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "rickandmortyapi.com"
        urlComponents.path = "/api/episode"
        
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
            
            do {
                let episodesResponse = try JSONDecoder().decode(EpisodesResponse.self, from: jsonData)
                let episodes = episodesResponse.results
                
                DispatchQueue.main.async {
                    complition(.success(episodes))
                }
                
            } catch {
                print(error)
                complition(.failure(error))
            }
        }
        
        task.resume()
    }
}
