//
//  RMCharacterGender.swift
//  RickAndMorty
//
//  Created by Kerem Demır on 31.03.2023.
//

import Foundation

enum RMCharacterGender: String, Codable {
    //('Female', 'Male', 'Genderless' or 'unknown').
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "unknown"
}
