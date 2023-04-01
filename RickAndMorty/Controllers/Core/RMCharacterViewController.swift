//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Kerem Demır on 30.03.2023.
//

import UIKit

final class RMCharacterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total : \(model.info.count)" )
                print("Page result count : \(model.results.count)" )
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
