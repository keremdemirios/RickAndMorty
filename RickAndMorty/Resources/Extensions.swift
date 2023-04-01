//
//  Extension+addSubViews.swift
//  RickAndMorty
//
//  Created by Kerem Demır on 1.04.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
