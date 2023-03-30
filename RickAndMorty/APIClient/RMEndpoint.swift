//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Kerem Demır on 30.03.2023.
//

import Foundation

/// Represent unique API endpoint
@frozen enum RMEndpoint: String {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
