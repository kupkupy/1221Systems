//
//  Location.swift
//  1221SystemsTest
//
//  Created by Tanya on 20.08.2023.
//

import Foundation

// MARK: - LocationResponse
struct LocationResponse: Codable {
    let results: [LocationData]
}

// MARK: - Result
struct LocationData: Codable {
    let dimension: String
    let id: Int
    let created, type: String
    let residents: [String]
    let name: String
    let url: String
}

