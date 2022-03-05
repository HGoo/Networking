//
//  CollectionViewController.swift
//  URLapp
//
//  Created by Николай Петров on 04.03.2022.
//

import UIKit

enum UserActions: String, CaseIterable {
    case downloadImage = "Download Image"
    case exampleOne = "Exampel One"
    case exampleTwo = "Exampel Two"
    case exampleThree = "Exampel Three"
    case exampleFour = "Exampel Four"
    case ourCourses = "Our Courses"
    
}

class MainViewController: UICollectionViewController {
    
    private let userActions = UserActions.allCases
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userActions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell
             
        cell.userActionLable.text = userActions[indexPath.item].rawValue
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .downloadImage:
            performSegue(withIdentifier: "showImage", sender: self)
        case .exampleOne:
            performSegue(withIdentifier: "ExampelOne", sender: self)
        case .exampleTwo:
            performSegue(withIdentifier: "ExampelTwo", sender: self)
        case .exampleThree:
            performSegue(withIdentifier: "ExampelThree", sender: self)
        case .exampleFour:
            performSegue(withIdentifier: "ExampelFour", sender: self)
        case .ourCourses:
            performSegue(withIdentifier: "OurCourses", sender: self)
        }
    }

    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier != "showImage" {
            let coursesVC = segue.destination as! CoursesViewController
            
            switch segue.identifier {
            case "ExampelOne":
                coursesVC.fetchDataV1()
            case "ExampelTwo":
                coursesVC.fetchDataV2()
            case "ExampelThree":
                coursesVC.fetchDataV3()
            case "ExampelFour":
                coursesVC.fetchDataV4()
            case "OurCourses":
                coursesVC.fetchDataV()
            default: break
            }
        }
    }


}

    // MARK: - CollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
