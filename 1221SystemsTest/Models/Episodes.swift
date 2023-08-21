//
//  Episodes.swift
//  1221SystemsTest
//
//  Created by Tanya on 20.08.2023.
//

import Foundation

// MARK: - EpisodesResponse
struct EpisodesResponse: Codable {
    let results: [EpisodesData]
}

// MARK: - Result
struct EpisodesData: Codable {
    let url: String
    let characters: [String]
    let id: Int
    let created, episode, name, airDate: String

    enum CodingKeys: String, CodingKey {
        case url, characters, id, created, episode, name
        case airDate = "air_date"
    }
}
