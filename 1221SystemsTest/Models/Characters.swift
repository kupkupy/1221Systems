//
//  Characters.swift
//  1221SystemsTest
//
//  Created by Tanya on 18.08.2023.
//

import Foundation

// MARK: - CharactersResponse
struct CharactersResponse: Codable {
    let results: [CharacterData]
}

// MARK: - Result
struct CharacterData: Codable {
    let id: Int
    let gender: Gender
    let url: String
    let type: String
    let species: Species
    let episode: [String]
    let location: Location
    let image: String
    let origin: Location
    let created, name: String
    let status: Status
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
