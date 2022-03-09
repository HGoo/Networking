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
    case postRequest = "POST Request"
    
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
        case .postRequest:
            postRequest()
            
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


extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}

extension MainViewController {
    private func postRequest() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        let userData = ["course": "Networking",
                        "lessonn": "GET and POST"]
        
        var  request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userData, options: []) else { return }
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { data, response, _ in
            guard let response = response, let data = data else { return }
            
            print(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch let error {
                print(error)
            }
            
        }.resume()
        
    }
}
