//
//  RMService.swift
//  RickAndMorty
//
//  Created by Kerem Demır on 30.03.2023.
//

import Foundation

/// Primary API Service object to get Rick and Morty data
final class RMService {
    
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    /// Send Rick and Morty API Call
    public func execute<T: Codable>(_ request: RMRequest,expecting: T.Type ,completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
