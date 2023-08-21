//
//  ProfileDetailsAPI.swift
//  1221SystemsTest
//
//  Created by Tanya on 19.08.2023.
//

import UIKit

final class LocationAPI {
    func getLocation(originName: String, complition: @escaping(Result<[LocationData], Error>) -> ()) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "rickandmortyapi.com"
        urlComponents.path = "/api/location"
        
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
            //print("=======JSON: \(jsonData.prettyJSON)")
            
            do {
                let locationResponse = try JSONDecoder().decode(LocationResponse.self, from: jsonData)
                let locations = locationResponse.results
                
                DispatchQueue.main.async {
                    complition(.success(locations))
                }
    
            } catch {
                print(error)
                complition(.failure(error))
            }
        }
        
        task.resume()
    }
}
