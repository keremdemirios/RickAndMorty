//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Kerem Demır on 3.04.2023.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character:RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
