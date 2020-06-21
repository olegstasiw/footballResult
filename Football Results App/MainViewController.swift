//
//  MainViewController.swift
//  Football Results App
//
//  Created by mac on 21.06.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

import UIKit

enum Categories: String, CaseIterable {
    case teams = "Teams"
    case teamsResult = "Teams Result"
}

class MainViewController: UICollectionViewController {
    
    private let userActions = Categories.allCases

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoriesCollectionViewCell
        
        let category = userActions[indexPath.item]
        cell.categoriesLabel.text = category.rawValue
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = userActions[indexPath.item]
        
        switch category {
        case .teams:
            performSegue(withIdentifier: "teamsSegue", sender: nil)
        case .teamsResult:
            performSegue(withIdentifier: "showResult", sender: nil)
        }
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
